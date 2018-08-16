FROM maven:3.5-alpine

# Make app directory
RUN mkdir -p /usr/src/app

# Set app directory as working directory
WORKDIR /usr/src/app

# Download VocBench, unzip, remove
RUN wget https://bitbucket.org/art-uniroma2/vocbench3/downloads/vocbench3-4.0.2_full.zip && \
    unzip ./vocbench3-4.0.2_full.zip && \
    rm ./vocbench3-4.0.2_full.zip

# Fix executable file permission
RUN chmod +x /usr/src/app/semanticturkey-4.0.2/bin/karaf

# Set container entrypoint on Karaf container script
ENTRYPOINT /usr/src/app/semanticturkey-4.0.2/bin/karaf

# Expose port 1979 (where ST runs by default)
EXPOSE 1979