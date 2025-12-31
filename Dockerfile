# Stage 1: Get n8n from latest distroless image
FROM n8nio/n8n:latest AS n8n-source

# Stage 2: Build on full Alpine with package manager
FROM node:22-alpine

# Copy n8n installation from official image
COPY --from=n8n-source /usr/local/lib/node_modules/n8n /usr/local/lib/node_modules/n8n
COPY --from=n8n-source /usr/local/bin/n8n /usr/local/bin/n8n

# Install your custom packages
RUN apk add --no-cache ffmpeg imagemagick python3 curl tini && \
    curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o /usr/local/bin/yt-dlp && \
    chmod a+rx /usr/local/bin/yt-dlp

# Create node user (matching n8n's setup)
RUN addgroup -g 1000 node || true && \
    adduser -u 1000 -G node -s /bin/sh -D node || true

# Set up working directory
WORKDIR /home/node
USER node

ENTRYPOINT ["tini", "--", "n8n"]
