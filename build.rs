fn main() {
    cc::Build::new()
        .file("native/print.c")
        .file("native/print.s")
        .compile("print_lib");
}