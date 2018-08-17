# Docker

Some containers.

## Install Docker

First, install Docker (e.g. on MacOS with homebrew).

```bash
brew cask install docker
```

Launch docker.

## Docker containers in Azure

First, create an azure container registry.

Then:

- Tag image with azure container registry name.
- Login to azure container registry.
- Push image to azure container registry.

```bash
docker tag <image-name>:<image-tag> <azure-container-registry-name>.azurecr.io/<image-name>:<image-tag>
cat ./password.txt | docker login --username <azure-container-registry-name> --password-stdin <azure-container-registry-name>.azurecr.io
docker push <azure-container-registry-name>.azurecr.io/<image-name>:<image-tag>
```

## Docker image in Docker Hub

- Tag image with Docker Hub username
- Login to Docker Hub
- Push image to Docker Hub

```bash
docker tag <image-name>:<image-tag> <docker-hub-username>/<image-name>:<image-tag>
docker login --username <docker-hub-username>
docker push <docker-hub-username>/<image-name>:<image-tag>
```
