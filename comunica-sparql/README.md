# Comunica SPARQL

Run SPARQL queries over RDF resources using [Comunica's SPARQL CLI tool](https://comunica.dev/docs/query/getting_started/query_cli/).

See: https://hub.docker.com/r/matthieubosquet/comunica-sparql

## Run SPARQL queries over RDF resources

Simple query of DBpedia:

```bash
docker run --rm -it matthieubosquet/comunica-sparql:latest https://fragments.dbpedia.org/2016-04/en "SELECT * WHERE { ?s ?p ?o } LIMIT 10"
```

## Pass in the query through a local file

If you keep a repository of handy SPARQL queries:

```bash
docker run --rm -v ~/SPARQL:/query -it matthieubosquet/comunica-sparql:latest https://fragments.dbpedia.org/2016-04/en -f test.sparql
```

## Run a query on a file

Use `comunica-sparql-file` instead!

```bash
docker run --rm -v ${PWD}:/query -it matthieubosquet/comunica-sparql-file:latest test.ttl "SELECT * WHERE { ?s ?p ?o } LIMIT 10"
```

## For programming

You might consider using comunica SPARQL RDFJS: https://www.npmjs.com/package/@comunica/actor-init-sparql-rdfjs.
