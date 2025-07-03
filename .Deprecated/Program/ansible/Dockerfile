FROM eoelab.org:1027/eoeair/jupyter:py-c

RUN pip install ansible-kernel && \
    python -m ansible_kernel.install && \
    pip cache purge
