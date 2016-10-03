CFLAGS += -O2 -g -I . -I ../libnl-3.2.27/include/
LIBS=-lnl-3 -lnl-genl-3 -lpthread -lm

PREFIX=/usr
BINDIR=$(PREFIX)/bin

all: swconfig

%.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $^

swconfig: cli.o swlib.o
	$(CC) $(LDFLAGS) -o $@ $^ $(LIBS)

install: all
	# Create directories
	mkdir -p $(DESTDIR)$(BINDIR)
	install -m 755 swconfig $(DESTDIR)$(BINDIR)

