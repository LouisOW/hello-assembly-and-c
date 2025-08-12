use std::ffi::CString;
use std::os::raw::c_char;

unsafe extern "C" {
    fn print_message_c(message: *const c_char);
    fn print_message_asm(message: *const c_char);
}

fn print(message: &str) {
    let c_message = CString::new(message).expect("CString::new failed");
    unsafe {
        print_message_c(c_message.as_ptr());
    }
}

fn print_asm(message: &str) {
    let c_message = CString::new(message).expect("CString::new failed");
    unsafe {
        print_message_asm(c_message.as_ptr());
    }
}

fn main() {
    let assembly = "Hello from Assembly!";
    let c = "Hello from C!";
    print(&c);
    print_asm(&assembly);
}
