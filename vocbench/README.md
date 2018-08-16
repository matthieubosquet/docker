# Vocbench in a Docker container

## Install Docker

First, install Docker (e.g. on MacOS with homebrew).

```bash
brew cask install docker
```

Launch docker.

## Create image & run

VocBench 3-4.0.2 (run detached, this version stops).

```bash
docker build --rm -f vocbench3-4.0.2.Dockerfile -t vocbench:3-4.0.2 -t vocbench:latest .
docker run --rm -it -p 1979:1979 vocbench:3-4.0.2
```

VocBench 3-3.0.1.

```bash
docker build --rm -f vocbench3-3.0.1.Dockerfile -t vocbench:3-3.0.1 .
docker run --rm -d -p 1979:1979 vocbench:3-3.0.1
```

## Pull image from Docker and run

```bash
docker run --rm -it -p 1979:1979 matthieubosquet/vocbench:latest
```