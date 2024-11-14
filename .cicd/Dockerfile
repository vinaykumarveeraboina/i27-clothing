FROM node:14
ARG SRC_DIR=/opt/i27

# Create directory inside the container
RUN mkdir $SRC_DIR

# Set the working directory inside the container
WORKDIR $SRC_DIR

# Copy the current content to /opt/i27 directory, this is our home directory
COPY . $SRC_DIR

# Install Node.js dependencies
RUN npm install

# Expose the port
EXPOSE 3000

# Copy the entrypoint script
COPY entrypoint.sh /entrypoint.sh

# Make the script executable
RUN chmod +x /entrypoint.sh

# Use CMD instead of ENTRYPOINT to start the application
CMD ["/entrypoint.sh"]