# Makefile for SliTaz Openbox menu.

PREFIX?=/usr
DESTDIR?=
DOMAIN=slitaz-ob-menu
MENU?=ob-menu/menu.xml.in
LINGUAS?=de fr hu ja pt ru zh_CN

BINDIR=$(DESTDIR)$(PREFIX)/bin
STSDATA=$(DESTDIR)$(PREFIX)/share/slitaz/sts

all: help

help:
	@echo "make [ pot | msgmerge | menu | clean ]"

pot:
	xgettext -o po/$(DOMAIN).pot --force-po --copyright-holder=SliTaz \
		--package-name=$(DOMAIN) --package-version=5.1.6 -L Shell $(MENU)
	sed 's|CHARSET|UTF-8|' -i po/$(DOMAIN).pot

msgmerge:
	@for l in $(LINGUAS); do \
		echo -n "Updating $$l po file."; \
		msgmerge -U po/$$l.po po/$(DOMAIN).pot; \
	done;

menu:
	@for l in $(LINGUAS); do \
		echo "Formatting $$l messages..."; \
		mkdir -p  /usr/share/locale/$$l/LC_MESSAGES; \
		msgfmt -o /usr/share/locale/$$l/LC_MESSAGES/$(DOMAIN).mo po/$$l.po; \
	done; \
	mkdir -p $(DESTDIR)/etc/xdg/openbox; \
	for l in en $(LINGUAS); do \
		echo "Processing $$l menu..."; \
		./ob-menu/menu.xml.in $$l > \
		$(DESTDIR)/etc/xdg/openbox/menu.$$l.xml; \
	done;

clean:
	rm -rf po/mo
	rm -f po/*~
	rm -f po/*.mo
