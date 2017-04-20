all:
	rgbasm -o main.o main.S
	rgblink -td -o main.gb main.o
	rgbfix main.gb
