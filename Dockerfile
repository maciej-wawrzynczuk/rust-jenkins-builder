FROM jenkins/inbound-agent:jdk21

USER root
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        build-essential=12.12 \
        musl-tools=1.2.5-3 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/

USER jenkins
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y
ENV PATH="/home/jenkins/.cargo/bin:${PATH}"
RUN rustup target add x86_64-unknown-linux-musl
