FROM docker.io/library/debian:unstable

ENV NAME=debian-toolbox VERSION=unstable
LABEL com.github.containers.toolbox="true" \
      com.github.debarshiray.toolbox="true" \
      name="$NAME" \
      version="$VERSION" \
      usage="This image is meant to be used with the toolbox command" \
      summary="Base image for creating Debian sid toolbox containers" \
      maintainer="Debarshi Ray <rishi@fedoraproject.org>"

RUN apt update

RUN apt -y upgrade

RUN apt install -y locales sudo
RUN apt clean

RUN locale-gen ja_JP.UTF-8
RUN localedef -f UTF-8 -i ja_JP ja_JP
ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:jp
ENV LC_ALL ja_JP.UTF-8

RUN sed -i -e 's/ ALL$/ NOPASSWD:ALL/' /etc/sudoers

RUN echo VARIANT_ID=container >> /etc/os-release
RUN touch /etc/localtime

CMD /bin/sh
