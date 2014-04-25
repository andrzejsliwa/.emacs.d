CC          = gcc
ERL_CFLAGS  = -I/usr/local/lib/erlang/lib/erl_interface-3.7.16/include -I/usr/local/lib/erlang/usr/include
ERL_LIB     = -L/usr/local/lib/erlang/lib/erl_interface-3.7.16/lib -lerl_interface -lei
CFLAGS      = -g -O2 -Wall -m64
LDFLAGS     = 

OUTDIR = ../../priv
#CFLAGS=-Wall -I/usr/local/include $(ERL_CFLAGS)
ERL_LDFLAGS= $(LDFLAGS) $(ERL_LIB)


$(OUTDIR)/gsuffixtree:	main.o gsuffix_tree.o
	$(CC)  $(ERL_LDFLAGS) main.o gsuffix_tree.o -lerl_interface -lei -lpthread -o $(OUTDIR)/gsuffixtree

gsuffix_tree.o:	gsuffix_tree.c gsuffix_tree.h
	$(CC) $(CFLAGS) $(ERL_CFLAGS) -o gsuffix_tree.o -c gsuffix_tree.c

main.o:	gsuffix_tree.h 
	$(CC) $(CFLAGS) $(ERL_CFLAGS) -o main.o -c main.c

clean:
	@-rm -f *.o
	@-rm -f gsuffixtree*
