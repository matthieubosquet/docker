#############################################
# SPARQL query RDF resources using Comunica #
#############################################

# Build image
# docker build --rm -f comunica-sparql.Dockerfile -t comunica-sparql:latest .

# Use the container (with --rm to remove it on exit)
## Run a query on a remote resource
# docker run --rm -it comunica-sparql:latest https://fragments.dbpedia.org/2016-04/en "SELECT * WHERE { ?s ?p ?o } LIMIT 10"
## Run a query in a local file on a remote resource
# docker run --rm -v ${PWD}:/query -it matthieubosquet/comunica-sparql:latest https://fragments.dbpedia.org/2016-04/en -f test.sparql
## Run a query against localhost
# docker run --rm --network host -it comunica-sparql:latest http://localhost:3000/foo "SELECT * WHERE { ?s ?p ?o } LIMIT 10"

# Debug container
# docker run --rm -v ${PWD}:/query -it --entrypoint /bin/bash comunica-sparql:latest

# Use latest node 12 base image
FROM node:12

RUN yarn global add @comunica/actor-init-sparql

RUN mkdir /query

WORKDIR /query

# Set command run by the container
ENTRYPOINT [ "comunica-sparql" ]
