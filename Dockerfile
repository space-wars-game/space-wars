FROM mmpg/base:0.1.1
MAINTAINER Héctor Ramón Jiménez <hector0193@gmail.com>

# Set working directory
WORKDIR game

# Add game files
ADD . /

# Update submodules
RUN git submodule update --init --recursive

# Build game
RUN ./bin/build

# Copy viewer files to nginx directory
COPY ./dist /usr/share/nginx/www

# Run game
CMD ./bin/run

# Expose http ports
EXPOSE [80, 8080]
