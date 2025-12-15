# ARG moet VOOR FROM staan om gebruikt te worden IN de FROM regel
ARG N8N_TAG=latest

# 1. Start from the official n8n base image
FROM n8nio/n8n:${N8N_TAG}

# 2. Switch to root for installing packages
USER root

# 3. Install FFmpeg, ImageMagick, and yt-dlp
RUN apk add --no-cache ffmpeg imagemagick python3 curl && \
    curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o /usr/local/bin/yt-dlp && \
    chmod a+rx /usr/local/bin/yt-dlp

# 4. Switch back to non-root user for security
USER node