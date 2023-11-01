FROM ubuntu:20.04

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y openssl jq bash-completion fzf netcat git unzip curl wget vim tcpdump net-tools iputils-ping telnet dnsutils && \
    rm -rf /var/lib/apt/lists/*
RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash 
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
RUN install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
RUN echo 'alias k=kubectl' >> /root/.bashrc
RUN echo 'source <(kubectl completion bash)' >>/root/.bashrc
RUN echo 'complete -o default -F __start_kubectl k' >>/root/.bashrc
RUN curl -L https://istio.io/downloadIstio | ISTIO_VERSION=1.19.90 sh
RUN curl -L https://istio.io/downloadIstio | sh -
RUN install -o root -g root -m 0755 istio-1.19.3/bin/istioctl /usr/local/bin/istioctl
RUN wget https://github.com/derailed/k9s/releases/download/v0.27.4/k9s_Linux_amd64.tar.gz
RUN tar zxf k9s_Linux_amd64.tar.gz
RUN mv k9s /usr/local/bin/
CMD ["sleep","infinity"]
