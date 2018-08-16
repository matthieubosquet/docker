# docker
Some containers

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

