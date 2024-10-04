SRC_DIR=../.
OUT_DIR=../../out

ASM=nasm
ASMFLAGS=-f elf64

LD=ld
LDFLAGS=-g

TEST_SRC=test-$(TARGET).asm
TEST_OBJ=$(OUT_DIR)/test-$(TARGET).o

all: $(TARGET)

$(OUT_DIR)/%.o: $(SRC_DIR)/%.asm
	$(ASM) $(ASMFLAGS) -o $@ $<

$(TEST_OBJ): $(TEST_SRC)
	$(ASM) $(ASMFLAGS) -o $@ $<

pow: $(OUT_DIR)/pow.o $(TEST_OBJ)
	$(LD) $(LDFLAGS) $(OUT_DIR)/pow.o $(TEST_OBJ) \
	-o $(OUT_DIR)/test-pow

factorial: $(OUT_DIR)/factorial.o $(TEST_OBJ)
	$(LD) $(LDFLAGS) $(OUT_DIR)/factorial.o $(TEST_OBJ) \
	-o $(OUT_DIR)/test-factorial

exp: $(OUT_DIR)/exp.o $(OUT_DIR)/pow.o $(OUT_DIR)/factorial.o $(TEST_OBJ)
	$(LD) $(LDFLAGS) $(OUT_DIR)/exp.o $(OUT_DIR)/pow.o $(OUT_DIR)/factorial.o $(TEST_OBJ) \
	-o $(OUT_DIR)/test-exp

logistic: $(OUT_DIR)/logistic.o $(OUT_DIR)/exp.o $(OUT_DIR)/pow.o $(OUT_DIR)/factorial.o $(TEST_OBJ)
	$(LD) $(LDFLAGS) $(OUT_DIR)/logistic.o $(OUT_DIR)/exp.o $(OUT_DIR)/pow.o $(OUT_DIR)/factorial.o $(TEST_OBJ) \
	-o $(OUT_DIR)/test-logistic

relu: $(OUT_DIR)/relu.o $(TEST_OBJ)
	$(LD) $(LDFLAGS) $(OUT_DIR)/relu.o $(TEST_OBJ) \
	-o $(OUT_DIR)/test-relu

clean:
	@rm $(OUT_DIR)/*
