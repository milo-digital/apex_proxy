FROM nginx:alpine
MAINTAINER Justin Kiang <justin@justinkiang.com>

RUN apk update && \
    apk --no-cache add tini ca-certificates nfs-utils

COPY ./bin /
ADD ./defaults.conf /etc/nginx/conf.d/

EXPOSE 80 443
CMD ["/entrypoint.sh"]
