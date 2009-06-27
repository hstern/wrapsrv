CC = gcc
CFLAGS = -O2 -g
WARN = -Wall -Wextra -Werror
INCLUDE = -I/usr/include/bind -I/usr/local/include/bind
LDFLAGS = -L/usr/local/lib -lbind
DESTDIR = /usr/local

BIN = wrapsrv
DOC = wrapsrv.1
SRC = wrapsrv.c

all: $(BIN) $(DOC)

$(BIN): $(SRC)
	$(CC) $(CFLAGS) $(WARN) -o $@ $(SRC) $(INCLUDE) $(LDFLAGS)

$(DOC): wrapsrv.docbook
	docbook2x-man $<

clean:
	rm -f $(BIN)

install: $(BIN)
	install -m 0755 $(BIN) $(DESTDIR)/bin

.PHONY: all clean install
