FROM ghcr.io/eoeair/jupyter:py-c

RUN pip install agda_kernel && \
    python -m agda_kernel.install && \
    pip cache purge
