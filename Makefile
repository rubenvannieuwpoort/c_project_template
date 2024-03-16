DEBUG ?= 0
NAME := example
SRC_DIR := src
BUILD_DIR := build
INCLUDE_DIR := include
BIN_DIR := bin

OBJS := $(patsubst %.c,%.o, $(wildcard $(SRC_DIR)/**/*.c) $(wildcard $(SRC_DIR)/*.c))

CC ?= clang

CFLAGS := -std=gnu17 -D _GNU_SOURCE -D __STDC_WANT_LIB_EXT1__ -Wall -Wextra -I$(INCLUDE_DIR) -pedantic
#   -std=gnu17: Use the GNU17 standard
#   -D _GNU_SOURCE: Use GNU extensions
#   -D __STDC_WANT_LIB_EXT1__: Use C11 extensions
#   -Wall: Enable all warnings
#   -Wextra: Enable extra warnings
#   -pedantic: Enable pedantic warnings
# 	-I$(INCLUDE_DIR): Include the include directory

LDFLAGS :=

ifeq ($(DEBUG), 1)
	CFLAGS := $(CFLAGS) -g -O0
else
	CFLAGS := $(CFLAGS) -O3
endif


$(NAME): $(OBJS)
	mkdir -p $(BIN_DIR)
	$(CC) $(CFLAGS) $(LDFLAGS) -o $(BIN_DIR)/$@ $(patsubst %, build/%, $(OBJS))

$(OBJS):
	@mkdir -p $(BUILD_DIR)/$(@D)
	@$(CC) $(CFLAGS) -o $(BUILD_DIR)/$@ -c $*.c

clean:
	@rm -rf $(BUILD_DIR) $(BIN_DIR)

.PHONY: clean
