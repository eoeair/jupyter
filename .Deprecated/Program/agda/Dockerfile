FROM eoelab.org:1027/eoeair/jupyter:py-c

RUN pip install agda_kernel && \
    python -m agda_kernel.install && \
    pip cache purge
