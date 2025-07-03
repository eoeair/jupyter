FROM ghcr.io/eoeair/jupyter:matlab-minimal

USER root

COPY conf/mpm_input_r2023b.txt /opt/mpm_input_r2023b.txt

RUN mpm install --inputfile /opt/mpm_input_r2023b.txt 

USER ${NB_UID}
