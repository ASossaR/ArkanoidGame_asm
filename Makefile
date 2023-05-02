build:
	nasm -f elf64 -o arkanoid.o arqui.asm
	ld -o arkanoid arkanoid.o
