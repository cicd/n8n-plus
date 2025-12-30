# 1. Start from the official n8n base image.
FROM n8nio/n8n:latest

# 2. Switch to the root user to gain permissions for installing packages.
USER root

# 3. Install FFmpeg, ImageMagick and dependencies.
#    Then, download the latest yt-dlp binary and make it executable.
RUN apt-get update && \
    apt-get install -y --no-install-recommends ffmpeg imagemagick python3 curl && \
    curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o /usr/local/bin/yt-dlp && \
    chmod a+rx /usr/local/bin/yt-dlp && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# 4. Switch back to the default non-root user ('node') for security.
USER node
