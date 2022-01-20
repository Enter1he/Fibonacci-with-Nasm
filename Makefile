all: Fib.obj
	gcc -m32 Fib.obj -o Fib.exe

Fib.obj:
	nasm -f win32 Fib.asm

clean:
	del Fib.obj && del Fib.exe