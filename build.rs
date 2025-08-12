fn main() {
    cc::Build::new()
        .file("print.c")
        .compile("print");
}