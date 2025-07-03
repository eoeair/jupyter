FROM ghcr.io/eoeair/jupyter:py-c

# Install Python 3 packages
RUN pip install  \
    # visualization
    'matplotlib' \
    # Scientific calculations
    'jax[cuda12]' &&\
    pip cache purge  && \
    MPLBACKEND=Agg python -c "import matplotlib.pyplot" 
