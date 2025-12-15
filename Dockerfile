USER node

ARG N8N_TAG=latest

FROM n8nio/n8n:${N8N_TAG}

USER root

# Installeer alles inclusief curl voor de download
RUN apk add --no-cache ffmpeg imagemagick python3 curl && \
    curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o /usr/local/bin/yt-dlp && \
    chmod a+rx /usr/local/bin/yt-dlp

USER node