#########################################
# Cow says fortunes beautiful container #
#########################################

# Build image
# docker build --rm -f cowsay-fortune.Dockerfile -t cowsay-fortune:latest .

# Start container (with --rm to remove it on exit)
# docker run --rm -it cowsay-fortune:latest.

# Use latest debian as base image
FROM debian:latest

# Install cowsay, fortune and fortune files (-y to say yes during install)
RUN apt-get update && apt-get install -y cowsay fortune fortunes-debian-hints fortunes-off

# Add /usr/games to the $PATH environment variable
# n.b.
# We could specify the full command path and not modify $PATH:
# ENTRYPOINT exec /usr/games/fortune | /usr/games/cowsay
ENV PATH $PATH:/usr/games

# Set command run by the container
ENTRYPOINT exec fortune | cowsay