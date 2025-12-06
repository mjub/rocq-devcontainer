# Compile Rocq files and generate documentation with a single Make command.

VFILES := $(shell find . -name '*.v')
CMD := rocq-all real-all rocq-html rocq-clean

all: rocq-all rocq-html

clean: rocq-clean
	@rm -rf CoqMakefile CoqMakefile.conf html

$(CMD): CoqMakefile
	@+$(MAKE) -f $< $(subst rocq-,,$@)

CoqMakefile: _CoqProject Makefile ${VFILES}
	@$(ROCQBIN)rocq makefile -f $< -o $@ $(shell rocq dep -sort ${VFILES})

.PHONY: ${CMD} $(subst rocq-,,${CMD})
