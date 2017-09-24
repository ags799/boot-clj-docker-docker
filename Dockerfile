FROM docker:17.06-git
RUN apk update
RUN apk add bash curl openjdk8
WORKDIR /usr/local/bin
RUN curl -fsSLo boot https://github.com/boot-clj/boot-bin/releases/download/latest/boot.sh
RUN chmod 755 boot
WORKDIR /root
ENV BOOT_AS_ROOT yes
# pre-download boot and its dependencies
RUN boot
ENTRYPOINT boot
