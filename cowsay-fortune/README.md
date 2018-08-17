# Cowsay fortune in a Docker container

## Create image & run

```bash
docker build --rm -f cowsay-fortune.Dockerfile -t cowsay-fortune:latest .
docker run --rm -it cowsay-fortune:latest
```

## Pull image from Docker and run

```bash
docker run --rm -it matthieubosquet/cowsay-fortune:latest
```