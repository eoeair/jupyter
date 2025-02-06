FROM eoelab.org:1027/eoeair/jupyter:py-c

# install torch
RUN pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cpu && \
    pip install jax[cpu] && \
    pip cache purge

