# Comunica SPARQL

Run SPARQL queries over RDF resources using [Comunica's SPARQL CLI tool](https://comunica.dev/docs/query/getting_started/query_cli/).

See: https://hub.docker.com/r/matthieubosquet/comunica-sparql

## Run SPARQL queries over RDF resources

```bash
docker run --rm -it matthieubosquet/comunica-sparql:latest https://fragments.dbpedia.org/2016-04/en "SELECT * WHERE { ?s ?p ?o } LIMIT 10"
```

## Pass in the query through a local file

```bash
docker run --rm -v ${PWD}:/query -it matthieubosquet/comunica-sparql:latest https://fragments.dbpedia.org/2016-04/en -f test.sparql
```
