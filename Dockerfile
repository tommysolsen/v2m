FROM ubuntu:latest
MAINTAINER tommysolsen@gmail.com

ADD https://github.com/alexellis/faas/releases/download/0.6.0/fwatchdog /usr/bin
RUN chmod +x /usr/bin/fwatchdog

ADD https://dl.minio.io/client/mc/release/linux-amd64/mc /usr/bin
RUN chmod +x /usr/bin/mc

ARG KEY
ARG SECRET
ARG SERVER_URL
ARG MINIO_PATH

ENV KEY $KEY
ENV SECRET $SECRET
ENV SERVER_URL $SERVER_URL
ENV MINIO_PATH $MINIO_PATH

WORKDIR /app

ADD handler.sh .

RUN apt-get update
RUN apt-get install -y python3 python3-pip ffmpeg
RUN pip3 install youtube_dl

ENV fprocess="sh ./handler.sh"
CMD ["fwatchdog"]