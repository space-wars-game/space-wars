FROM mmpg/base:0.1.2
MAINTAINER Héctor Ramón Jiménez <hector0193@gmail.com>

# Set working directory
WORKDIR game

# Install API
RUN go get github.com/mmpg/api/cmd/api

# Add engine files
ADD engine engine

# Build engine
RUN cd engine && ./bin/build

# Copy viewer files to nginx directory
COPY ./viewer/dist/ /var/www/html

# Add scripts
ADD bin bin

# Run game
CMD ./bin/run

# Expose http ports
EXPOSE 80 8080
