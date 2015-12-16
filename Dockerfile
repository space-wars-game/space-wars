FROM mmpg/base:0.1.3
MAINTAINER Héctor Ramón Jiménez <hector0193@gmail.com>

# Set working directory
WORKDIR game

# Add game files
ADD . .

# Install API
COPY go get github.com/mmpg/api/cmd/api

# Build engine
RUN ./engine/bin/build

# Copy viewer files to nginx directory
COPY ./viewer/dist/* /usr/share/nginx/www/.

# Run game
CMD ./bin/run

# Expose http ports
EXPOSE [80, 8080]
