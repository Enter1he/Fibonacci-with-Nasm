;Fib.asm
;printing first 21 Fibonacci numbers using C standard library

extern _printf

section .data 
    msg db "over.", 10,0
    a db "%d", 10, 0
    

section .text

global _main

%define A dword[ebp-4]
%define B dword[ebp-8]

prInt:
    push ebp
    mov ebp, esp 
    mov eax, [ebp+8]

    push dword[ebp+8]
    push dword a
    call _printf 
    
    mov esp, ebp
    pop ebp
    ret


_main:
    push ebp
    mov ebp, esp
    sub esp, 0x8 ; allocating 2 dwords
    
    mov A, 0 ;a := 4
    mov B, 1 ;b := 8
    mov ebx, 1 ;setting iterators variable


    start:
    cmp ebx, 21
    jg lep  ;if i < 7

    push A
    call prInt

    mov ecx, B
    add A, ecx
    
    mov ecx, A
    mov eax, B
    mov A, eax
    mov B, ecx 
    
    add ebx, 1 ;iterating
    jmp start
    lep:

    push msg
    call _printf ;printf("over.)"
    
    mov esp, ebp
    pop ebp
    ret

