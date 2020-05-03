FROM ubuntu:20.04

ARG DROPBOX_ACCESS_TOKEN=""
ENV DROPBOX_ACCESS_TOKEN $DROPBOX_ACCESS_TOKEN


RUN apt update
RUN apt install -y wget rclone nginx fuse sudo
COPY contextualize.sh .

EXPOSE 8000 8001

ENTRYPOINT bash contextualize.sh
