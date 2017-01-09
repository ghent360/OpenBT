CFLAGS += -O2 -g -I . 
#LIBS=-lm

PREFIX=/usr
BINDIR=$(PREFIX)/bin

all: timelogger

%.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $^

timelogger: timelogger.o
	$(CC) $(LDFLAGS) -o $@ $^ $(LIBS)

install: all
	# Create directories
	mkdir -p $(DESTDIR)$(BINDIR)
	install -m 755 timelogger $(DESTDIR)$(BINDIR)

