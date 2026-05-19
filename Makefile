BINDIR   := $(HOME)/bin
SKILLDIR := $(HOME)/.claude/skills/hzdb-cli

LINUX_MD := $(lastword $(sort $(wildcard hzdb-*-linux.md)))

.PHONY: install download check-version clean

install: $(BINDIR)/hzdb $(BINDIR)/hzdb.exe $(SKILLDIR)/hzdb.md

download: hzdb.exe

check-version:
	npm view @meta-quest/hzdb-win32-x64 version

hzdb.exe:
	curl -sL "$$(npm view @meta-quest/hzdb-win32-x64 dist.tarball)" | tar xz --strip-components=2 package/bin/hzdb.exe

$(BINDIR)/hzdb: hzdb
	install -Dm755 $< $@

$(BINDIR)/hzdb.exe: hzdb.exe
	install -Dm755 $< $@

$(SKILLDIR)/hzdb.md: $(LINUX_MD)
	install -Dm644 $< $@

clean:
	rm -f hzdb.exe
