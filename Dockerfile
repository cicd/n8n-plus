# 1. Start from the official n8n base image.
FROM n8nio/n8n:latest

# 2. Switch to the root user to gain permissions for installing packages.
USER root

# 3. Install FFmpeg and ImageMagick.
#    Then, download the latest yt-dlp binary and make it executable.
#    This method avoids Python package conflicts.
RUN apk add --no-cache ffmpeg imagemagick python3 && \
    wget https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -O /usr/local/bin/yt-dlp && \
    chmod a+rx /usr/local/bin/yt-dlp

# 4. Switch back to the default non-root user ('node') for security.
USER node
