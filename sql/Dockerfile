FROM ghcr.io/eoeair/jupyter:python AS builder

ENV MAMBA_ROOT_PREFIX=/opt/mamba

COPY .condarc /opt/mamba/.condarc

USER root

RUN apt-get update --yes && apt-get install --yes curl bzip2 && \
    curl -Ls https://micro.mamba.pm/api/micromamba/linux-64/latest | tar -xvj bin/micromamba && \
    chmod +x bin/micromamba && \
    bin/micromamba install --yes --root-prefix /opt/mamba xeus-sql

FROM ghcr.io/eoeair/jupyter:python

COPY --chown="${NB_UID}:${NB_GID}" --from=builder /opt/mamba /opt/mamba

ENV PATH="/opt/mamba/bin:${PATH}"

RUN pip install duckdb && pip cache purge && \
    jupyter kernelspec install /opt/mamba/share/jupyter/kernels/xsql --sys-prefix