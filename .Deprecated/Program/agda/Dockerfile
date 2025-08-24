FROM ghcr.io/eoeair/jupyter:python

RUN pip install agda_kernel && \
    python -m agda_kernel.install && \
    pip cache purge
