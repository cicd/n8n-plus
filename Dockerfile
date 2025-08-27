# 1. Start from the official n8n base image.
FROM n8nio/n8n:latest

# 2. Switch to the root user to gain permissions for installing packages.
USER root

# 3. Installeer ffmpeg, python, en de python package installer (pip)
# Gebruik daarna pip om yt-dlp te installeren.
RUN apk add --no-cache ffmpeg imagemagick python3 py3-pip && \
    pip install --no-cache-dir yt-dlp

# 4. Switch back to the default non-root user ('node') for security.
USER node