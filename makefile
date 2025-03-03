CC = gcc
CFLAGS = -Wall -Wextra -g -fPIC
LDFLAGS = -dynamiclib
RUSTC = rustc

C_LIB = libmylib.dylib
C_PROG = system-call
RUST_EXEC = rust-to-c

all: $(C_LIB) $(C_PROG) $(RUST_EXEC)

$(C_PROG): system-call.o
	$(CC) $(CFLAGS) -o $(C_PROG) system-call.o

system-call.o: system-call.c
	$(CC) $(CFLAGS) -c system-call.c

$(C_LIB): mylib.o
	$(CC) $(LDFLAGS) -o $(C_LIB) mylib.o

mylib.o: mylib.c
	$(CC) $(CFLAGS) -c mylib.c

$(RUST_EXEC): rust-to-c.rs
	$(RUSTC) -o $(RUST_EXEC) rust-to-c.rs -L. -lmylib

clean:
	rm -f $(C_PROG) $(RUST_EXEC) $(C_LIB) *.o
