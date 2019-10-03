kernel.bin: boot.s
	nasm -f bin $^ -o $@
