# Use n8n 2.0.2 - last version with apk available
# (v2.1.0+ removed apk, making custom builds impossible)
FROM n8nio/n8n:2.0.2

USER root

# Install FFmpeg, ImageMagick and yt-dlp
RUN apk add --no-cache ffmpeg imagemagick python3 curl && \
    curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o /usr/local/bin/yt-dlp && \
    chmod a+rx /usr/local/bin/yt-dlp

USER node
