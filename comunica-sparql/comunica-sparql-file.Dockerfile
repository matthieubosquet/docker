#########################################
# SPARQL query RDF files using Comunica #
#########################################

# Build image
# docker build --rm -f comunica-sparql-file.Dockerfile -t comunica-sparql-file:latest .

# Use the container (with --rm to remove it on exit)
## Run a query on a file
# docker run --rm -v ${PWD}:/query -it comunica-sparql-file:latest test.ttl "SELECT * WHERE { ?s ?p ?o } LIMIT 10"
## Run a query in a local file on a file
# docker run --rm -v ${PWD}:/query -it matthieubosquet/comunica-sparql:latest test.ttl -f test.sparql

# Debug container
# docker run --rm -v ${PWD}:/query -it --entrypoint /bin/bash comunica-sparql-file:latest

# Use latest node 12 base image
FROM node:12

RUN yarn global add @comunica/actor-init-sparql-file

RUN mkdir /query

WORKDIR /query

# Set command run by the container
ENTRYPOINT [ "comunica-sparql-file" ]
