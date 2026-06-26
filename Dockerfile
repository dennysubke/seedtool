FROM nginxinc/nginx-unprivileged:alpine

LABEL org.opencontainers.image.title="Seedtool"
LABEL org.opencontainers.image.description="Dockerized static Seedtool"
LABEL org.opencontainers.image.source="https://github.com/dennysubke/seedtool"
LABEL org.opencontainers.image.licenses="GPL-3.0"

COPY --chown=nginx:nginx dist/index.html /usr/share/nginx/html/index.html

EXPOSE 8080
