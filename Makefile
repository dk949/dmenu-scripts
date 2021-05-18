include config.mk
all:

clean:

install: all
	mkdir -p ${DESTDIR}${PREFIX}/bin/
	install bookmark ${DESTDIR}${PREFIX}/bin/bookmark
	install greek ${DESTDIR}${PREFIX}/bin/greek
	install screenshot ${DESTDIR}${PREFIX}/bin/screenshot
	install sym ${DESTDIR}${PREFIX}/bin/sym

uninstall:
	rm -f ${DESTDIR}${PREFIX}/bin/bookmark
	rm -f ${DESTDIR}${PREFIX}/bin/greek
	rm -f ${DESTDIR}${PREFIX}/bin/screenshot
	rm -f ${DESTDIR}${PREFIX}/bin/sym

.PHONY: all clean install uninstall
