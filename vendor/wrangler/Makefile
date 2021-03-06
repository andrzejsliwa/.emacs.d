APPNAME = wrangler
include vsn.mk

prefix       = /usr/local
exec_prefix  = ${prefix}
libdir       = ${exec_prefix}/lib
LIB_DIR      = ${libdir}/erlang/lib/$(APPNAME)-$(VERSION)
ERL          = "/usr/local/bin/erl"
ERLC         = "/usr/local/bin/erlc"

DOC_OPTS={def,{version,\"$(VERSION)\"}}

########################################
## Main part

YRL = src/wrangler_parse.yrl

YRL_ERL =  $(patsubst src/%.yrl,src/%.erl, $(YRL)))

FIRST_ERL = src/wrangler_expand_rule.erl \
   src/wrangler_scan.erl src/wrangler_epp_dodger.erl \
   src/wrangler_syntax.erl src/wrangler_syntax_lib.erl \
   src/wrangler_misc.erl src/api_ast_traverse.erl src/api_refac.erl

FIRST_SRC= $(FIRST_YRL) $(FIRST_ERL)

BUILD_FIRST = $(patsubst src/%.yrl,ebin/%.beam, $(YRL)) \
                $(patsubst src/%.erl,ebin/%.beam, $(FIRST_ERL))

ERL_SRC = $(wildcard src/*.erl)

ERL_GEN_REFACS_SRC = $(wildcard src/gen_refacs/*.erl)

ERL_MY_GEN_REFACS_SRC= $(wildcard src/my_gen_refacs/*.erl)

ERL_GEN_COMP_SRC = $(wildcard src/gen_composite_refacs/*.erl)

ERL_MY_GEN_COMP_SRC = $(wildcard src/my_gen_composite_refacs/*.erl)

LAST_SRC = $(filter-out $(FIRST_SRC), $(ERL_SRC)) $(ERL_GEN_REFACS_SRC) \
   $(ERL_MY_GEN_REFACS_SRC) $(ERL_GEN_COMP_SRC) $(ERL_MY_GEN_COMP_SRC)

ERL_LAST = $(patsubst src/%.erl,ebin/%.beam,$(ERL_SRC)) \
	$(patsubst src/gen_refacs/%.erl, ebin/%.beam, $(ERL_GEN_REFACS_SRC)) \
	$(patsubst src/my_gen_refacs/%.erl, ebin/%.beam, \
	  $(ERL_MY_GEN_REFACS_SRC)) \
	$(patsubst src/gen_composite_refacs/%.erl, ebin/%.beam, \
	  $(ERL_GEN_COMP_SRC)) \
	$(patsubst src/my_gen_composite_refacs/%.erl, ebin/%.beam, \
	  $(ERL_MY_GEN_COMP_SRC))

ERL_OBJ = $(BUILD_FIRST) $(ERL_LAST)

.PHONY: default all conf erl c elisp

default: conf erl c elisp

all: default docs

CONF_SRC = Makefile.in c_src/suffixtree/Makefile.in \
		c_src/gsuffixtree/Makefile.in
CONF_OBJ = $(patsubst %.in,%,$(CONF_SRC))

ELISP_SRC = elisp/wrangler.el.src

ELISP_OBJ = $(patsubst elisp/%.src, elisp/%, $(ELISP_SRC))

conf: $(CONF_OBJ)

erl: $(ERL_OBJ)

c:
	@cd ./c_src; make; cd ../..

elisp: $(ELISP_OBJ)

########################################
## Rules

$(CONF_OBJ): configure $(CONF_SRC)
	./configure

.SUFFIXES: .erl .yrl

## Erlang

## Parallel dependencies
src/api_refac.erl: ebin/wrangler_expand_rule.beam ebin/wrangler_syntax.beam

$(FIRST_ERL): ebin/wrangler_parse.beam

$(LAST_SRC): $(BUILD_FIRST)

$(ERL_GEN_REFACS_SRC) $(ERL_MY_GEN_REFACS_SRC): ebin/gen_refac.beam

src/refac_batch_rename_fun.erl $(ERL_GEN_COMP_SRC) \
   $(ERL_MY_GEN_COMP_SRC): ebin/gen_composite_refac.beam

##

ebin/%.beam: src/%.erl
	$(ERLC) -pa ebin -I include -W -o ebin +debug_info $<

ebin/%.beam: src/gen_refacs/%.erl
	$(ERLC) -pa ebin -I include -W -o ebin +debug_info $<

ebin/%.beam: src/my_gen_refacs/%.erl
	$(ERLC) -pa ebin -I include -W -o ebin +debug_info $<

ebin/%.beam: src/gen_composite_refacs/%.erl
	$(ERLC) -pa ebin -I include -W -o ebin +debug_info $<

ebin/%.beam: src/my_gen_composite_refacs/%.erl
	$(ERLC) -pa ebin -I include -W -o ebin +debug_info $<

ebin/%.beam: include/wrangler.hrl include/wrangler_internal.hrl

src/%.erl: src/%.yrl
	$(ERLC) -o src $<

$(ELISP_OBJ): $(ELISP_SRC)
	cp $(ELISP_SRC) $(ELISP_OBJ);
	escript ebin/dynamic_menu_items >>$(ELISP_OBJ)

########################################


clean:
	@cd ./c_src; make clean; cd ../..
	@-rm -f ${ERL_OBJ} src/wrangler_parse.erl
	@-rm -f $(ELISP_OBJ)
	@-rm -f priv/suffixtree priv/gsuffixtree
	@-rm -f doc/*.html doc/edoc-info doc/erlang.png doc/stylesheet.css
	@-rm -f doc/*.erl

distclean: clean
	@-rm -f $(CONF_OBJ)
	@-rm -f config.* configure.scan
	@-rm -rf autom4te.cache

install: default
	@echo "* Installing Emacs Lisp Library"
	install -m 775 -d $(LIB_DIR)/elisp
	install -m 775 elisp/*.el $(LIB_DIR)/elisp
	@echo
	@echo "* Installing Erlang Library"
	install -m 775 -d $(LIB_DIR)/ebin
	install -m 775 ebin/*.beam $(LIB_DIR)/ebin
	install -m 775 ebin/*.app $(LIB_DIR)/ebin
	install -m 775 -d $(LIB_DIR)/src
	install -m 775 src/*.erl $(LIB_DIR)/src
	install -m 775 -d $(LIB_DIR)/include
	install -m 775 include/*.hrl $(LIB_DIR)/include
	install -m 775 -d $(LIB_DIR)/priv
	install -m 775 priv/suffixtree* $(LIB_DIR)/priv
	install -m 755 priv/gsuffixtree* $(LIB_DIR)/priv
	install -m 775 priv/side_effect_plt $(LIB_DIR)/priv
	install -m 775 priv/dialyzer_plt $(LIB_DIR)/priv
	@echo
	@echo "*** Successfully installed. See README for usage instructions."
	@echo

wc:
	@echo "* Emacs Lisp"
	@wc -l */*.el | sort -nr
	@echo "* Erlang"
	@wc -l */*.erl | sort -nr
	@echo "* C"
	@wc -l */*.c | sort -nr

EXAMPLE_CODE = inspec_examples.erl \
    gen_refacs/refac_apply_to_remote_call.erl \
    gen_refacs/refac_remove_an_argument.erl \
    gen_refacs/refac_remove_an_import_attribute.erl \
    gen_refacs/refac_add_an_import_attribute.erl \
    gen_refacs/refac_specialise_a_function.erl \
    gen_refacs/refac_swap_function_arguments.erl \
    gen_composite_refacs/refac_batch_clone_elimination.erl \
    gen_composite_refacs/refac_batch_prefix_module.erl \
    refac_batch_rename_fun.erl regexp_re.erl keysearch_keyfind.erl

docs:
	$(ERL) -noshell -eval \
	"edoc:application($(APPNAME), \".\", [$(DOC_OPTS), {packages, false}])"\
	-s init stop
	(cd src ; cp $(EXAMPLE_CODE) ../doc/)

privdocs:
	$(MAKE) DOC_OPTS='$(DOC_OPTS)',private docs
