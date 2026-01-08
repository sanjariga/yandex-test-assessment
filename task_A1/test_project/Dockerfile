FROM nginx:alpine

LABEL org.opencontainers.image.authors="Aleksandr Kostin <sanjariga@gmail.com>"

COPY default.conf /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/nginx.conf
COPY index.html /usr/share/nginx/html/index.html

RUN mkdir -p /var/cache/nginx /var/run \
    && chown -R nginx:nginx \
       /var/cache/nginx \
       /var/log/nginx \
       /var/run \
       /usr/share/nginx/html \
       /etc/nginx

EXPOSE 8080

USER nginx
CMD ["nginx", "-g", "daemon off;"]