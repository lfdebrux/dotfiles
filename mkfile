
PWD=`{pwd}
UNAME=`{uname}

LN=ln
TEST=./atest

ALL=\
	nvim \
	readline \
	tmux

all:V: ${ALL}

tmux:V: ~/.tmux.conf ~/.tmux.machine.conf

~/.tmux.machine.conf:P$TEST -ef: tmux.${UNAME}.conf
	ln -s ${PWD}/tmux.${UNAME}.conf ~/.tmux.machine.conf

nvim:V: ~/.config/nvim

readline:V: ~/.inputrc

# an automatic rule for linking things to $HOME
~/.%:Papply -2 '/bin/test %1 -ef %2': %
	${LN} -s ${PWD}${stem} ~/.${stem}

