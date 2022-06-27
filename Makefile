
PATH := $(dir $(abspath $(lastword ${MAKEFILE_LIST})))
UNAME := $(shell uname)

LN := $(shell which ln)

TARGETS := \
	~/.config/git \
	~/.config/tig \
	~/.config/tmux \
	~/.config/nvim \
	~/.inputrc \
	~/.tigrc \
	~/.tmux.conf

~/.%: %
	$(LN) -s $(LNFLAGS) $(PATH)$< $@

link: $(TARGETS)
