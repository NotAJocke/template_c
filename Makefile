CC=gcc
CFLAGS=-Wall -Wextra -Werror
SRC = src/main.c src/adder.c
OBJ = target/lib/main.o target/lib/adder.o
HEADERS = include
TARGET_DIR = target/bin
LIB_DIR = target/lib
TARGET = $(TARGET_DIR)/my_project

all: $(TARGET)

# Create necessary directories if they don't exist
# and compile project
$(TARGET): $(OBJ)
	@mkdir -p $(TARGET_DIR)
	$(CC) -I$(HEADERS) $(OBJ) -o $(TARGET)

# Compile source files into object files
target/lib/%.o: src/%.c
	@mkdir -p $(LIB_DIR)
	$(CC) $(CFLAGS) -c $< -o $@

# Clean up all build artifacts
clean:
	rm -rf target

# Run the executable
run:
	@./$(TARGET)

