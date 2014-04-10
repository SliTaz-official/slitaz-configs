# Makefile for SliTaz Openbox menu.

PREFIX?=/usr
DESTDIR?=
DOMAIN=slitaz-ob-menu
MENU?=ob-menu/menu.xml.in
LINGUAS?=fr hu pt_BR ru

BINDIR=$(DESTDIR)$(PREFIX)/bin
STSDATA=$(DESTDIR)$(PREFIX)/share/slitaz/sts

all: help

help:
	@echo "make [ pot | msgmerge | menu | clean ]"

install-sts:
	install -m 0777 -d $(BINDIR)
	install -m 0777 -d $(STSDATA)
	install -m 0755 sts/sts $(BINDIR)/sts
	install -m 0755 sts/sts-session $(BINDIR)/sts-session
	cp -a sts/applications $(DESTDIR)$(PREFIX)/usr/share
	cp -a sts/lxpanel $(STSDATA)
	cp -a sts/openbox $(STSDATA)

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
		mkdir -p po/mo/$$l/LC_MESSAGES; \
		msgfmt -o po/mo/$$l/LC_MESSAGES/$(DOMAIN).mo po/$$l.po; \
	done; \
	mkdir -p $(DESTDIR)/etc/xdg/openbox; \
	for l in en $(LINGUAS); do \
		echo "Processing $$l menu..."; \
		./ob-menu/menu.xml.in $$l `pwd`/po/mo > \
		$(DESTDIR)/etc/xdg/openbox/menu.$$l.xml; \
	done;

clean:
	rm -rf po/mo
	rm -f po/*~
