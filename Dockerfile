FROM node:14

ARG SRC_DIR=/opt/i27

# Which will be created in the container
RUN mkdir -p $SRC_DIR

# This is the work directory
WORKDIR $SRC_DIR

# Copy the current directory content to /opt/i27 
COPY . $SRC_DIR

# Installing all the dependencied
RUN npm install 

# Expose container port 3000
EXPOSE 3000

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]