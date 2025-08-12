use std::ffi::CString;
use std::os::raw::c_char;

unsafe extern "C" {
    fn print_message(message: *const c_char);
}

fn print(message: &str) {
    let c_message = CString::new(message).expect("CString::new failed");
    unsafe {
        print_message(c_message.as_ptr());
    }
}

fn main() {
    let themessage = "ijij";
    print(&themessage);
}
