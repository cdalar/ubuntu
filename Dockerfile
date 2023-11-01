FROM ubuntu:20.04

# Install debugging tools
RUN apt-get update && \
    apt-get install -y curl wget vim tcpdump net-tools iputils-ping telnet dnsutils && \
    rm -rf /var/lib/apt/lists/*

# Set the default command to bash
CMD ["sleep infinity"]
