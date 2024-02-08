FROM debian:bullseye

RUN apt-get update && apt install -y vsftpd

COPY conf/vsftpd.conf /etc/vsftpd/vsftpd.conf
COPY conf/vsftpd.conf /etc/vsftpd.conf
COPY tools/ftp.sh /usr/local/bin/ftp.sh

RUN mkdir -p /var/run/vsftpd
RUN chmod +x /usr/local/bin/ftp.sh

ENTRYPOINT ["/usr/local/bin/ftp.sh"]
