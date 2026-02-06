FROM jenkins/inbound-agent:latest

USER root

RUN apt-get update && \
    apt-get install -y build-essential && \
    apt-get clean

USER jenkins
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y
ENV PATH="/home/jenkins/.cargo/bin:${PATH}"
