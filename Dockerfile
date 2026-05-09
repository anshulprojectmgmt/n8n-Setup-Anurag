FROM mwader/static-ffmpeg:8.1.1 AS ffmpeg-source

FROM docker.n8n.io/n8nio/n8n:latest

USER root

COPY --from=ffmpeg-source /ffmpeg /usr/local/bin/ffmpeg
COPY --from=ffmpeg-source /ffprobe /usr/local/bin/ffprobe

RUN chmod +x /usr/local/bin/ffmpeg /usr/local/bin/ffprobe \
    && mkdir -p /automation/n8n-inputs \
    && mkdir -p /automation/n8n-data/extracted_audio \
    && mkdir -p /automation/n8n-data/highlight_segments \
    && mkdir -p /automation/n8n-data/avatar_videos \
    && mkdir -p /automation/n8n-data/final_video \
    && chmod -R 777 /automation

USER node