FROM docker:latest
LABEL maintainer="satyamnegg@gmail.com"
RUN apk --update add python3 \
    && apk --update add py3-pip \
    && pip3 install --no-cache-dir --upgrade pip \
    && pip3 install --no-cache-dir --upgrade awscli 
RUN wget -q https://storage.googleapis.com/kubernetes-release/release/$(wget -q -O - https://storage.googleapis.com/kubernetes-release/release/stable.txt -O -)/bin/linux/amd64/kubectl -O kubectl
RUN chmod +x ./kubectl && mv ./kubectl /usr/local/bin/kubectl
#ENTRYPOINT ["bash", "aws"]
RUN mkdir -p ~/.kube
