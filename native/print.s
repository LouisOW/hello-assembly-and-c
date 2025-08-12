.section __TEXT,__text,regular,pure_instructions
    // Defines a section named __TEXT,__text for code.
    // regular: normal code, pure_instructions: no side effects.

.globl _print_message_asm
    // Makes the symbol _print_message_asm globally visible (exported)
    // so the linker and external code (Rust) can call it.

.p2align 2
    // Aligns the following code on a 4-byte boundary (2^2 = 4),
    // improving CPU instruction fetch efficiency.

_print_message_asm:
    // Function label: entry point of print_message_asm.

    stp x29, x30, [sp, #-16]!
    // Store Pair (stp) of registers x29 (frame pointer) and x30 (link register)
    // onto the stack. Decrement stack pointer (sp) by 16 bytes before storing.
    // This saves the caller's frame pointer and return address (prologue).

    mov x29, sp
    // Set current frame pointer (x29) to stack pointer (sp),
    // establishing a new stack frame for this function.

    bl _printf
    // Branch with link (bl) to external function _printf.
    // Calls printf to print the string whose pointer is in x0.
    // (x0 holds first argument by AArch64 calling convention)

    ldp x29, x30, [sp], #16
    // Load Pair (ldp) of x29 and x30 from the stack, restoring saved frame pointer
    // and return address. Then increment sp by 16 (post-index), cleaning the stack
    // (epilogue).

    ret
    // Return from function using address in x30 (link register).