# Compiler and flags
CC = gcc
CFLAGS = -Wall -Wextra -Werror -Iinclude

# Automatically detect source files and corresponding object files
SRC = $(wildcard src/*.c)
OBJ = $(patsubst src/%.c, target/lib/%.o, $(SRC))

# Target directories
TARGET_DIR = target/bin
LIB_DIR = target/lib
TARGET = $(TARGET_DIR)/my_project

# Default target
all: $(TARGET)
	
compile_commands:
	bear -- make

# Create target from object files
$(TARGET): $(OBJ)
	@mkdir -p $(TARGET_DIR)
	$(CC) $(OBJ) -o $(TARGET)

# Compile source files into object files
target/lib/%.o: src/%.c | $(LIB_DIR)
	$(CC) $(CFLAGS) -c $< -o $@

# Ensure the lib directory exists
$(LIB_DIR):
	@mkdir -p $(LIB_DIR)

# Clean up build artifacts
clean:
	rm -rf target

# Run the executable
run: $(TARGET)
	@./$(TARGET)
