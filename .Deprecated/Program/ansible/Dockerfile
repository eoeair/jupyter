FROM ghcr.io/eoeair/jupyter:python

RUN pip install ansible-kernel && \
    python -m ansible_kernel.install && \
    pip cache purge
