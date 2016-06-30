CFLAGS ?=	-Wall -ggdb -W -O
CC ?=	gcc
LIBS ?=
LDFLAGS ?=
PREFIX ?=	/usr/local
VERSION ?=1.5
TMPDIR=/tmp/wpt-$(VERSION)

all:    wpt tags 

tags:   *.c
	-ctags *.c

install:  wpt
	install -s wpt $(DESTDIR)$(PREFIX)/bin
	install -m 644 wpt.1 $(DESTDIR)$(PREFIX)/man/man1
	install -d $(DESTDIR)$(PREFIX)/share/doc/wpt
	install -m 644 debian/copyright $(DESTDIR)$(PREFIX)/share/doc/wpt
	install -m 644 debian/changelog $(DESTDIR)$(PREFIX)/share/doc/wpt

wpt:    wpt.o Makefile
	$(CC) $(CFLAGS) -o wpt wpt.o $(LIBS)

clean:
	-rm -f *.o wpt *~ core *.core tags

tar:    clean
	-debian/rules clean
	rm -rf $(TMPDIR)
	install -d $(TMPDIR)
	cp -p Makefile wpt.c socket.c wpt.l $(TMPDIR)
	install -d $(TMPDIR)/debian
	-cp -p debian/* $(TMPDIR)/debian
	ln -sf debian/copyright $(TMPDIR)/COPYRIGHT
	ln -sf debian/changelog $(TMPDIR)/ChangeLog
	-cd $(TMPDIR) && cd .. tar cozf wpt-$(VERSION).tar.gz wpt-$(VERSION)

wpt.o:  wpt.c socket.c Makefile

.PHONY: clean install all tar
