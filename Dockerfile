FROM ubuntu:latest
MAINTAINER tommysolsen@gmail.com

ADD https://github.com/alexellis/faas/releases/download/0.6.0/fwatchdog /usr/bin
RUN chmod +x /usr/bin/fwatchdog

ADD https://dl.minio.io/client/mc/release/linux-amd64/mc /usr/bin
RUN chmod +x /usr/bin/mc

WORKDIR /app

ADD handler.sh .
ADD arg_fixer.py .

RUN apt-get update
RUN apt-get install -y python3 python3-pip ffmpeg
RUN pip3 install youtube_dl

ENV fprocess="sh ./handler.sh"
CMD ["fwatchdog"]