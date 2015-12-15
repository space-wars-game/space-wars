FROM mmpg/base:0.1.0
MAINTAINER Héctor Ramón Jiménez <hector0193@gmail.com>


ADD . /

RUN cd engine && ./bin/build
RUN cd api && ./bin/build
RUN cd viewer && ./bin/build
