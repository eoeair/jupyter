FROM eoelab.org:1027/eoeair/jupyter:scipy-g

# install torch
RUN pip install torch torchvision torchaudio && \
# install flax
    pip install flax loaderx && \
    pip cache purge
