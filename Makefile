ASM := nasm
CC := gcc

ASMFLAGS_DEBUG := -f elf64 -g -F dwarf
ASMFLAGS_RELEASE := -f elf64

LDFLAGS := -no-pie -g

BUILD := debug
ASMFLAGS := $(ASMFLAGS_DEBUG)

SRC_DIR  := ./src
TEST_DIR := ./tests
OUT_DIR  := ./out

SRC_SRCS  := $(wildcard $(SRC_DIR)/*.asm)
TEST_SRCS := $(wildcard $(TEST_DIR)/test-*.asm)

SRC_OBJS := $(patsubst $(SRC_DIR)/%.asm,$(OUT_DIR)/%.o,$(filter-out $(TEST_DIR)/%,$(SRC_SRCS)))

TEST_OBJS := $(patsubst $(TEST_DIR)/test-%.asm,$(OUT_DIR)/test-%.o,$(TEST_SRCS))
TEST_BINS := $(patsubst $(TEST_DIR)/test-%.asm,$(OUT_DIR)/test-%,$(TEST_SRCS))

.PHONY: all debug release bins libs clean outdir

all: debug bins

debug:
	@echo "Build: debug"
	$(eval ASMFLAGS := $(ASMFLAGS_DEBUG))
	@mkdir -p $(OUT_DIR)

release:
	@echo "Build: release"
	$(eval ASMFLAGS := $(ASMFLAGS_RELEASE))
	@mkdir -p $(OUT_DIR)

outdir:
	@mkdir -p $(OUT_DIR)

$(OUT_DIR)/%.o: $(SRC_DIR)/%.asm | outdir
	$(ASM) $(ASMFLAGS) -o $@ $<

$(OUT_DIR)/test-%.o: $(TEST_DIR)/test-%.asm | outdir
	$(ASM) $(ASMFLAGS) -o $@ $<

TEST_LIBS_ALL := $(SRC_OBJS)

$(OUT_DIR)/test-%: $(OUT_DIR)/test-%.o $(TEST_LIBS_ALL)
	ld -o $@ $^

bins: $(TEST_BINS)

libs: $(SRC_OBJS)

clean:
	@[ -n "$(OUT_DIR)" ] && rm -rf "$(OUT_DIR)"
