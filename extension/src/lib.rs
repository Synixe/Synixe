use std::sync::Mutex;
use std::time::SystemTime;

#[macro_use]
extern crate lazy_static;

use arma_rs::{rv, rv_handler};
use discord_rpc_client::Client as Discord;
use enigo::{Enigo, KeyboardControllable, Key};
use webbrowser;

lazy_static! {
    static ref RPCM: Mutex<Discord> = Mutex::new(Discord::new(411594868293500938));
}

static mut STARTED: bool = false;
static mut TIMESTAMP: u64 = 0;

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
unsafe fn setup() {
    if !STARTED {
        RPCM.lock().unwrap().start();
        STARTED = true;
    }
    TIMESTAMP = SystemTime::now().duration_since(SystemTime::UNIX_EPOCH).unwrap().as_secs();
}

#[rv(thread=true)]
#[allow(unused_must_use)]
unsafe fn update(details: String, state: String, image: String, text: String) {
    RPCM.lock().unwrap().set_activity(|a| a
        .details(details)
        .state(state)
        .assets(|ass| ass
            .large_image(image)
            .large_text(text)
        )
        .timestamps(|time| time
            .start(TIMESTAMP)
        )
    );
}

#[rv_handler]
unsafe fn init() {
    if !STARTED {
        STARTED = true;
        RPCM.lock().unwrap().start();
    }
}
