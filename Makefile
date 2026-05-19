BINDIR   := $(HOME)/bin
SKILLDIR := $(HOME)/.claude/skills/hzdb-cli

LINUX_MD := $(lastword $(sort $(wildcard hzdb-*-linux.md)))

.PHONY: install clean

install: $(BINDIR)/hzdb $(BINDIR)/hzdb.exe $(SKILLDIR)/hzdb.md

$(BINDIR)/hzdb: hzdb
	install -Dm755 $< $@

$(BINDIR)/hzdb.exe: hzdb.exe
	install -Dm755 $< $@

$(SKILLDIR)/hzdb.md: $(LINUX_MD)
	install -Dm644 $< $@

clean:
	rm -f hzdb.exe
