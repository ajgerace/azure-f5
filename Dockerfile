FROM alpine:latest
LABEL maintainer="Anthony Gerace"
LABEL version="1.2"
LABEL description="F5 Azure Agility lab docker container"

RUN apk add --update --no-cache  git py-pip vim curl openssh-client  \
  libffi-dev openssl-dev python-dev gcc make musl-dev util-linux bash jq

RUN pip install --no-cache-dir --upgrade pip  
RUN pip install ansible \
    bigsuds f5-sdk netaddr deepdiff packaging msrestazure azure-cli 

RUN pip install ansible[azure] && \
    mkdir -p /home/ansible/playbooks && \
    mkdir -p /home/ansible/group_vars && \
    mkdir -p /home/ansible/tmp && \
    adduser -u 1001 -D -h /home/ansible ansible 
WORKDIR /home/ansible



