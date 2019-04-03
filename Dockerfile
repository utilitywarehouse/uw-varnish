FROM alpine:3.8

ENV VARNISH_MEMORY 100m

RUN apk --update --no-cache add varnish

COPY start.sh /start.sh

RUN chmod +x /start.sh

EXPOSE 80
CMD ["/start.sh"]