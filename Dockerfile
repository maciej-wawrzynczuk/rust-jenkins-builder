FROM jenkins/inbound-agent:latest

USER root

RUN apt-get update && \
    apt-get install -y build-essential musl-tools && \
    apt-get clean

USER jenkins
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y
ENV PATH="/home/jenkins/.cargo/bin:${PATH}"
RUN rustup target add x86_64-unknown-linux-musl
