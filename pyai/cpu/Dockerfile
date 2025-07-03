FROM eoelab.org:1027/eoeair/jupyter:py-c

# install torch
RUN pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cpu && \
# install flax
    pip install flax loaderx && \
    pip cache purge

