FROM eoelab.org:1027/eoeair/jupyter:py-c

USER root
# Install Octave + graph_toolkit
RUN apt-get update --yes && \
    apt-get install --yes octave gnuplot && \
    apt-get clean && rm -rf /var/lib/apt/lists/* 

USER ${NB_UID}

RUN pip install octave_kernel && \
    pip cache purge