#####################################################
# Run a Solid Community Server over your filesystem #
#####################################################

# Build image
# docker build --rm -f solid-community-fileserver.Dockerfile -t solid-community-server:latest .

# Run the server against your current user's Solid directory
# docker run --rm -v ~/Solid:/data -p 3000:3000 -it ghcr.io/matthieubosquet/solid-community-server:latest

# Debug container
# docker run --rm -v ~/Solid:/data -it --entrypoint /bin/bash solid-community-server:latest

# Use latest node LTS base image
FROM node:lts

LABEL maintainer=matthieubosquet@gmail.com

# Clone the latest community server & install
RUN git clone https://github.com/solid/community-server.git

WORKDIR /community-server

RUN npm audit --production --audit-level=high

RUN npm ci

# Container config & data dir for volume sharing
# Defaults to filestorage with /data directory (passed through CMD below)
RUN mkdir /config && mkdir /data

# Informs Docker that the container listens on the specified network port at runtime
EXPOSE 3000

# Set command run by the container
ENTRYPOINT [ "node", "/community-server/bin/server.js" ]

# By default run in filemode (overriden if passing alternative arguments)
CMD [ "-c", "config/config-file.json", "-f", "/data" ]
