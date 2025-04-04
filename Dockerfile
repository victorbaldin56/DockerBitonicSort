FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y \
        pocl-opencl-icd \
        clinfo \
        clang \
        python3 \
        python3-pip \
        python3-venv \
        cmake \
        git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN python3 -m venv .venv && \
    sh .venv/bin/activate && \
    pip install --no-cache-dir conan

WORKDIR /app
COPY . .
