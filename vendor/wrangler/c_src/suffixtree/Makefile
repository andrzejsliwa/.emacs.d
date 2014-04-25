CC          = gcc
ERL_CFLAGS  = -I/usr/local/lib/erlang/lib/erl_interface-3.7.16/include -I/usr/local/lib/erlang/usr/include
ERL_LIB     = -L/usr/local/lib/erlang/lib/erl_interface-3.7.16/lib -lerl_interface -lei
CFLAGS      = -g -O2 -Wall -m64
LDFLAGS     = 

OUTDIR = ../../priv
#CFLAGS=-Wall -I/usr/local/include $(ERL_CFLAGS)
ERL_LDFLAGS= $(LDFLAGS) $(ERL_LIB)


$(OUTDIR)/suffixtree:	main.o suffix_tree.o
	$(CC)  $(ERL_LDFLAGS) main.o suffix_tree.o -lerl_interface -lei -lpthread -o $(OUTDIR)/suffixtree

suffix_tree.o:	suffix_tree.c suffix_tree.h
	$(CC) $(CFLAGS) $(ERL_CFLAGS) -o suffix_tree.o -c suffix_tree.c

main.o:	suffix_tree.h 
	$(CC) $(CFLAGS) $(ERL_CFLAGS) -o main.o -c main.c

clean:
	@-rm -f *.o
	@-rm -f $(OUTDIR)/suffixtree*
