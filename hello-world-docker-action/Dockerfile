# Set the base image to use for subsequent instructions
FROM alpine:3.23

# Set the working directory inside the container
WORKDIR /usr/src

# Copy any source file(s) required for the action
COPY entrypoint.sh .

# Create a non-root user and switch to it
RUN addgroup -S actiongroup && adduser -S actionuser -G actiongroup && \
    chown -R actionuser:actiongroup /usr/src && \
    chmod +x /usr/src/entrypoint.sh && \
    # Ensure the GitHub Actions directories exist and are writable
    mkdir -p /github/file_commands && \
    chmod 777 /github/file_commands

USER actionuser

# Configure the container to be run as an executable
ENTRYPOINT ["/usr/src/entrypoint.sh"]



