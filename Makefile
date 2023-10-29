CC=gcc
INSTALL=install
MKDIR=mkdir -p
RM=rm -f

all: dcc-preproc syntax.vim

clean:
	$(RM) dcc-preproc
	$(RM) syntax.vim
	$(RM) example

install: dcc-preproc syntax.vim
	$(MKDIR) ~/.local/bin
	$(MKDIR) ~/.config/nvim/syntax
	$(MKDIR) ~/.config/nvim/ftdetect
	$(INSTALL) -m755 dcc-preproc ~/.local/bin/dcc-preproc
	$(INSTALL) -m755 dcc.sh ~/.local/bin/dcc
	$(INSTALL) -m644 syntax.vim ~/.config/nvim/syntax/dc.vim
	$(INSTALL) -m644 ftdetect.vim ~/.config/nvim/ftdetect/dc.vim

dcc-preproc: dcc-preproc.c rules.h
	$(CC) -o dcc-preproc dcc-preproc.c

syntax.vim: rules.h gen_syntax_file.py
	python gen_syntax_file.py

