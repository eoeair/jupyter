FROM ghcr.io/eoeair/jupyter:py-c

RUN pip install ansible-kernel && \
    python -m ansible_kernel.install && \
    pip cache purge
