FROM debian:bullseye

RUN apt-get update && apt install redis -y

COPY ./tools/redis.sh /usr/local/bin/redis.sh

RUN chmod +x /usr/local/bin/redis.sh

EXPOSE 6379

ENTRYPOINT [ "./usr/local/bin/redis.sh"]
