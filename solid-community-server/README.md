# Solid Community Server filesystem

Run a [Solid Community Server](https://github.com/solid/community-server) over your filesystem.

See: https://hub.docker.com/r/matthieubosquet/solid-community-fileserver

## Run the server

You can run the server mounting for example your `~/Solid` directory to serve files from.

Here the server will be accessible via `http://localhost:3000`.

```bash
docker run --rm -v ~/Solid:/data -p 3000:3000 -it matthieubosquet/solid-community-fileserver:latest
```
