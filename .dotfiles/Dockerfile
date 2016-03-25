FROM gliderlabs/alpine:latest

RUN apk-install git zsh perl

ADD bootstrap .
RUN ./bootstrap
RUN rm ./bootstrap
RUN /bin/zsh

ENTRYPOINT ["/bin/zsh"]
