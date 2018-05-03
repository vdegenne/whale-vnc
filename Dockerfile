FROM debian:stretch-slim

RUN apt-get update -y && apt-get install -y curl
RUN curl -sSL http://update.whale.naver.net/downloads/installers/naver-whale-stable_amd64.deb > /whale.deb
RUN dpkg -i /whale.deb 2>/dev/null || apt-get --fix-broken install -y
RUN apt-get install -y x11vnc xvfb
RUN mkdir ~/.vnc
RUN echo 'naver-whale-stable --no-sandbox --user-data-dir=/data' >> ~/.bashrc
RUN rm /whale.deb

COPY docker-entrypoint.sh /usr/local/bin/
RUN ln -s usr/local/bin/docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh
ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["x11vnc", "-forever", "-usepw", "-create"]