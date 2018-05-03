FROM debian:stretch-slim

RUN apt-get update -y && apt-get install -y curl
RUN curl http://update.whale.naver.net/downloads/installers/naver-whale-stable_amd64.deb > /whale.deb
# or
# COPY whale.deb /whale.deb
RUN dpkg -i /whale.deb || apt-get --fix-broken install -y
RUN apt-get install -y x11vnc xvfb
RUN mkdir ~/.vnc
RUN x11vnc -storepasswd 1234 ~/.vnc/passwd
RUN bash -c 'echo "naver-whale-stable --no-sandbox --user-data-dir=/data" >> ~/.bashrc'
RUN rm /whale.deb
CMD ["x11vnc", "-forever", "-usepw", "-create"]