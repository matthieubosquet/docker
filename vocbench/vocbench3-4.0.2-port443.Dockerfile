# VocBench 3-4.0.2 running on https and port 443 
# Build: docker build --rm -f vocbench3-4.0.2-port443.Dockerfile -t vocbench:3-4.0.2-port443 .
# Run: docker run --rm -it -p 443:443 vocbench:3-4.0.2-port443
# Docker Hub Tag: docker tag vocbench:3-4.0.2-port443 matthieubosquet/vocbench:3-4.0.2-port443
# Docker Hub Run: docker run --rm -it -p 443:443 matthieubosquet/vocbench:3-4.0.2-port443
FROM maven:3.5-alpine

# Make app directory. Download VocBench, unzip, remove
RUN mkdir -p /usr/src/app && \
    cd /usr/src/app && \
    wget https://bitbucket.org/art-uniroma2/vocbench3/downloads/vocbench3-4.0.2_full.zip && \
    unzip ./vocbench3-4.0.2_full.zip && \
    rm ./vocbench3-4.0.2_full.zip

# Set ST directory as working directory
WORKDIR /usr/src/app/semanticturkey-4.0.2

# Prepare VocBench to run on port 443 (change org.osgi.service.http.port & vbconfig). Fix executable file permission.
RUN sed -i 's/org\.osgi\.service\.http\.port=1979/org\.osgi\.service\.http\.port=443/' etc/org.ops4j.pax.web.cfg && \
    mkdir deploy/tmp && \
    unzip -q deploy/vocbench3-4.0.2.war -d deploy/tmp/ && \
    cd deploy/tmp && \
    sed -i 's/var st_port = "1979";/var st_port = "443";/' vbconfig.js && \
    sed -i 's/var st_protocol = "http";/var st_protocol = "https";/' vbconfig.js && \
    jar -cf 'vocbench3-4.0.2.war' * && \
    cd ../ && \
    mv -f tmp/vocbench3-4.0.2.war ./ && \
    rm -rf tmp && \
    cd .. && \
    chmod +x bin/karaf

# Set container entrypoint on Semantic Turkey server script
CMD ["bin/karaf"]

# Expose port 443 (where ST runs with modifications)
EXPOSE 443