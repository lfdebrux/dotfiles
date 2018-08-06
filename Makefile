
PATH := $(dir $(abspath $(lastword ${MAKEFILE_LIST})))
UNAME := $(shell uname)

LN = ln

TARGETS := \
	~/.config/nvim \
	~/.inputrc \
	~/.tmux.conf \
	~/.tmux.machine.conf

~/.%: %
	$(LN) -s $(LNFLAGS) $(PATH)$< $@

link: $(TARGETS)

~/.tmux.machine.conf: tmux.$(UNAME).conf
	ln -s $(PATH)tmux.$(UNAME).conf ~/.tmux.machine.conf
