#####################################################
# Run a Solid Community Server over your filesystem #
#####################################################

# Build image
# docker build --rm -f solid-community-fileserver.Dockerfile -t solid-community-fileserver:latest .

# Run the server against your current user's Solid directory
# docker run --rm -v ~/Solid:/data -p 3000:3000 -it matthieubosquet/solid-community-fileserver:latest

# Debug container
# docker run --rm -v ~/Solid:/data -it --entrypoint /bin/bash solid-community-fileserver:latest

# Use latest node LTS base image
FROM node:lts

# Clone the latest community server & install
RUN git clone https://github.com/solid/community-server.git

WORKDIR /community-server

RUN npm ci

RUN npm run build

# Container data dir for volume sharing (passed through -f option below)
RUN mkdir /data

# Create a mount point (not sure it's really better)
#VOLUME [ "/data" ]

# Informs Docker that the container listens on the specified network port at runtime
EXPOSE 3000

# Set command run by the container
ENTRYPOINT [ "node", "/community-server/bin/server.js", "-c", "config/config-file.json", "-f", "/data", "-p", "3000" ]
