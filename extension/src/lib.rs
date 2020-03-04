use std::collections::HashMap;
use std::sync::Mutex;
use std::thread;
use std::time::SystemTime;

#[macro_use]
extern crate lazy_static;

use arma_rs::{rv, rv_handler};
use arma_rs_macros::rv_callback;

use discord_rpc_sdk::{DiscordUser, EventHandlers, RichPresence, RPC};
use enigo::{Enigo, Key, KeyboardControllable};
use webbrowser;

struct Handlers;
impl EventHandlers for Handlers {
    fn ready(user: DiscordUser) {
        thread::spawn(move || {
            thread::sleep(std::time::Duration::from_secs(2));   
            rv_callback!("synixe", "user_ready", user.user_id, user.username);
        });
    }

    fn errored(errcode: i32, message: &str) {
        println!("Error {}: {}", errcode, message);
    }

    fn disconnected(errcode: i32, message: &str) {
        println!("Disconnected {}: {}", errcode, message);
    }

    fn join_game(secret: &str) {
        println!("Joining {}", secret);
    }

    fn spectate_game(secret: &str) {
        println!("Spectating {}", secret);
    }

    fn join_request(from: DiscordUser) {
        println!("Join request from {:?}", from);
    }
}

lazy_static! {
    static ref RPCM: Mutex<RPC> =
        Mutex::new(RPC::init::<Handlers>("411594868293500938", true, None).unwrap());
}

static mut TIMESTAMP: Option<SystemTime> = None;
static mut PROFILE_NAME: String = String::new();

#[rv(thread=true)]
fn watchdog(body: String) {
    let client = reqwest::blocking::Client::new();
    let mut data = HashMap::new();
    data.insert("content", body);
    client.post("https://discordapp.com/api/webhooks/682424869132173321/zEVbsLRCNmCG842TBt_vwjxLBv7TB0zFVzxDXUObk7js1Ut0PFlzupcQciHPqkOLf0jh")
        .json(&data)
        .send();
}

#[rv]
fn screenshot() {
    Enigo::new().key_click(Key::F12);
}

#[rv]
#[allow(unused_must_use)]
fn browser(url: String) -> String {
    webbrowser::open(&url);
    url
}

#[rv]
unsafe fn setup(_steam_id: String, profile_name: String) {
    TIMESTAMP = Some(SystemTime::now());
    PROFILE_NAME = profile_name;
}

#[rv(thread = true)]
#[allow(unused_must_use)]
unsafe fn update(details: String, state: String, image: String, text: String) {
    let presence = RichPresence {
        details: Some(details),
        state: Some(state),
        start_time: TIMESTAMP,
        large_image_key: Some(image),
        large_image_text: Some(text),
        small_image_key: None,
        small_image_text: None,
        party_size: None,
        party_max: None,
        spectate_secret: None,
        join_secret: None,
        ..Default::default()
    };
    RPCM.lock().unwrap().update_presence(presence).unwrap();
}

#[rv_handler]
unsafe fn init() {
    thread::spawn(|| loop {
        RPCM.lock().unwrap().run_callbacks();
        thread::sleep(std::time::Duration::from_secs(1));
    });
}
