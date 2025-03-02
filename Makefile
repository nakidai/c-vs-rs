.POSIX:

RUSTC ?= rustc
RUSTFLAGS = -C opt-level=z -C strip=symbols -C lto -C panic=abort

CC ?= cc
CFLAGS = -Oz -static
LDFLAGS = -flto -Oz

.PHONY: all
all: rust c

.PHONY: rust
rust: main.rs.elf

.PHONY: c
c: main.c.elf

main.rs.elf: main.rs
	${RUSTC} ${RUSTFLAGS} -omain.rs.elf main.rs

main.c.elf: main.c
	${CC} ${CFLAGS} ${LDFLAGS} -omain.c.elf main.c
	strip main.c.elf
