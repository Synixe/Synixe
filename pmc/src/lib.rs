use std::sync::Mutex;
use std::thread;

use arma_rs::{rv, rv_handler};

#[macro_use]
extern crate lazy_static;

#[macro_use]
extern crate mysql;

lazy_static! {
    static ref POOL: Mutex<mysql::Pool> = Mutex::new(mysql::Pool::new(std::env::var("PMC_HOST").unwrap().to_string()).unwrap());
}

#[rv]
fn save_loadout(player: String, loadout: String) {
    POOL.lock().unwrap().prepare(r##"
    INSERT INTO pmc.loadouts
        (player, loadout)
    VALUES
        (:player, :loadout)
    ON DUPLICATE KEY UPDATE
        player = :player,
        loadout = :loadout;
  "##).unwrap().execute(params!{
    "player" => player,
    "loadout" => loadout,
  }).unwrap();
}

#[rv]
fn get_loadout(player: String) -> String {
    let res = POOL.lock().unwrap().prep_exec(
        "SELECT loadout FROM pmc.loadouts WHERE (loadouts.player = :player) LIMIT 1",
        params!{
            "player" => player,
        }
    ).unwrap();
    if res.more_results_exists() {
        for row in res {
            let loadout = mysql::from_row(row.unwrap());
            return loadout;
        }
    }
    ":NOTFOUND".to_owned()
}

#[rv]
fn save_variable(player: String, name: String, value: String) {
    POOL.lock().unwrap().prepare(r##"
        INSERT INTO pmc.variables
            (player, name, value)
        VALUES
            (:player, :name, :value)
        ON DUPLICATE KEY UPDATE
            player = :player,
            name = :name,
            value = :value
    "##).unwrap().execute(params!{
        "player" => player,
        "name" => name,
        "value" => value,
    }).unwrap();
}

#[rv]
fn get_variables(player: String) -> String {
    let res = POOL.lock().unwrap().prep_exec(
        "SELECT name, value FROM pmc.variables WHERE (variables.player = :player)",
        params!{
            "player" => player,
        }
    ).unwrap();
    let mut text = String::from("[");
    let mut first = true;
    for row in res {
        let (name, value): (String, String) = mysql::from_row(row.unwrap());
        if !first {
            text.push_str(",");
        }
        first = false;
        text.push_str(&format!("[\"{}\",{}]", name, value));
    }
    text.push_str("]");
    text
}

#[rv_handler]
unsafe fn init() {
    thread::spawn(|| loop {
        POOL.lock().unwrap().prep_exec(r##"
            CREATE DATABASE IF NOT EXISTS pmc;
            "##, ()).unwrap();
            POOL.lock().unwrap().prep_exec(r##"
            CREATE TABLE IF NOT EXISTS pmc.loadouts (
                player varchar(64) not null,
                loadout text,
                primary key (player)
            )"##, ()).unwrap();
            POOL.lock().unwrap().prep_exec(r##"
            CREATE TABLE IF NOT EXISTS pmc.variables (
                player varchar(64) not null,
                name varchar(128) not null,
                value text,
                primary key (player, name)
            )"##, ()).unwrap();
    });
}
