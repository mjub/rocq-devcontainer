ARG COQ_VERSION
FROM coqorg/coq:${COQ_VERSION}

ARG VSCOQ_VERSION
RUN opam install --yes vscoq-language-server.${VSCOQ_VERSION}
