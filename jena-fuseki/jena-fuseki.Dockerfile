###############
# Jena Fuseki #
###############

# Build image
# docker build --rm -f jena-fuseki.Dockerfile -t jena-fuseki:latest .

# Tag image (i.e. to publish to Docker Hub)
# docker tag jena-fuseki:latest matthieubosquet/jena-fuseki:latest

# Push to Docker Hub
# docker push matthieubosquet/jena-fuseki:latest

# Start container
# docker run --rm -d -p 8080:8080 matthieubosquet/jena-fuseki:latest

# Use tomcat jre 8 alpine as base image
FROM tomcat:9-jre8-alpine

# Build time arguments (jena version)
ARG version=3.8.0

# Set Tomcat webapps as working directory
WORKDIR /usr/local/tomcat/webapps

# Config for fuseki server to work in Docker (do not restrict access to localhost)
COPY shiro.ini /tmp/

# Install fuseki
RUN wget -P /tmp/ http://www-us.apache.org/dist/jena/binaries/apache-jena-fuseki-${version}.tar.gz && \
    # Clean up tomcat webapp directory
    rm -rf * && \
    # Install Jena fuseki as ROOT app
    tar -zxvf /tmp/apache-jena-fuseki-${version}.tar.gz -C ./ && \
    mv apache-jena-fuseki-${version}/fuseki.war ./ROOT.war && \
    rm -rf apache-jena-fuseki-${version} && \
    # Add fuseki configuration (allow access to non-localhost)
    mkdir -p /etc/fuseki/configuration && \
    mv /tmp/shiro.ini /etc/fuseki/ && \
    rm -rf /tmp/*

# Run default server
CMD ["catalina.sh", "run"]