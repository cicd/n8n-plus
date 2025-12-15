ARG N8N_TAG=latest

FROM n8nio/n8n:${N8N_TAG}

USER root

# Detecteer package manager en installeer dependencies
RUN if command -v apk > /dev/null; then \
        # Alpine Linux
        apk add --no-cache ffmpeg imagemagick python3 curl wget; \
    elif command -v apt-get > /dev/null; then \
        # Debian/Ubuntu
        apt-get update && apt-get install -y --no-install-recommends ffmpeg imagemagick python3 curl wget && rm -rf /var/lib/apt/lists/*; \
    fi && \
    # Download yt-dlp (werkt op beide)
    curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o /usr/local/bin/yt-dlp && \
    chmod a+rx /usr/local/bin/yt-dlp

USER node