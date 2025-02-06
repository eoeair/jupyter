FROM eoelab.org:1027/eoeair/jupyter:scipy-g

# install torch transformers
RUN pip install torch torchvision torchaudio "jax[cuda12]" && \
    pip cache purge

