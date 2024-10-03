SRC_DIR=../.
OUT_DIR=../../out

all:
	nasm -f elf64 $(SRC_DIR)/$(TARGET).asm -o $(OUT_DIR)/$(TARGET).o
	nasm -f elf64 test-$(TARGET).asm -o $(OUT_DIR)/test-$(TARGET).o
	ld -g $(OUT_DIR)/$(TARGET).o $(OUT_DIR)/test-$(TARGET).o -o $(OUT_DIR)/test-$(TARGET)

clean:
	@rm $(OUT_DIR)/*
