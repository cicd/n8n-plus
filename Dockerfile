# Full Alpine image with n8n installed via npm
FROM node:22-alpine

# Install build dependencies, n8n, and your custom packages
RUN apk add --no-cache \
    ffmpeg \
    imagemagick \
    python3 \
    curl \
    tini \
    # Build dependencies for native modules
    python3 \
    make \
    g++ && \
    # Install n8n globally
    npm install -g n8n && \
    # Install yt-dlp
    curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o /usr/local/bin/yt-dlp && \
    chmod a+rx /usr/local/bin/yt-dlp && \
    # Cleanup build dependencies to reduce image size
    apk del make g++ && \
    rm -rf /root/.npm /tmp/*

WORKDIR /home/node
USER node

ENV N8N_USER_FOLDER=/home/node/.n8n

ENTRYPOINT ["tini", "--", "n8n"]
