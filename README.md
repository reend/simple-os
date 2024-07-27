FASM

compile: fasm boot.asm boot.bin
create img: C:/dd/dd.exe if=boot.bin of=boot.img bs=512 count=1