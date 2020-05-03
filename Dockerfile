FROM ubuntu:20.04

#give ARG RAILS_ENV a default value = production
ARG DROPBOX_ACCESS_TOKEN=""

#assign the $RAILS_ENV arg to the RAILS_ENV ENV so that it can be accessed
#by the subsequent RUN call within the container
ENV DROPBOX_ACCESS_TOKEN $DROPBOX_ACCESS_TOKEN


RUN apt update
RUN apt install -y wget rclone nginx fuse sudo
COPY contextualize.sh .

EXPOSE 8000 8001

ENTRYPOINT bash contextualize.sh #DROPBOX_ACCESS_TOKEN
