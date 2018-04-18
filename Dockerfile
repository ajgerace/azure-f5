FROM alpine:latest
LABEL maintainer="Anthony Gerace"

RUN apk add --update --no-cache  git py-pip vim curl openssh-client  \
  libffi-dev openssl-dev musl-dev jq python-dev bash gcc make 


RUN pip install --no-cache-dir --upgrade pip wheel
RUN pip install ansible azure-cli \
    bigsuds f5-sdk netaddr deepdiff  boto boto3 ansible[azure] && \
    mkdir -p /home/ansible && adduser -u 1001 -D -h /home/ansible ansible 
WORKDIR /home/ansible



