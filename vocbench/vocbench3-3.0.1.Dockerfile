FROM maven:3.5-alpine

# Make app directory
RUN mkdir -p /usr/src/app

# Set app directory as working directory
WORKDIR /usr/src/app

# Download VocBench, unzip, remove
RUN wget https://bitbucket.org/art-uniroma2/vocbench3/downloads/vocbench3-3.0.1-full.zip && \
    unzip ./vocbench3-3.0.1-full.zip && \
    rm ./vocbench3-3.0.1-full.zip

# Fix executable file permission
RUN chmod +x /usr/src/app/semanticturkey-3.0/bin/st_server_run

# Set container entrypoint on Semantic Turkey server script
ENTRYPOINT /usr/src/app/semanticturkey-3.0/bin/st_server_run

# Expose port 1979 (where ST runs by default)
EXPOSE 1979