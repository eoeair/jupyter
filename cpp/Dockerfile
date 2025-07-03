FROM ghcr.io/eoeair/jupyter:py-c AS builder

ENV MAMBA_ROOT_PREFIX=/opt/mamba

COPY .condarc /opt/mamba/.condarc

USER root

RUN apt-get update --yes && apt-get install --yes wget && \
    apt-get clean && rm -rf /var/lib/apt/lists/* && \
    curl -Ls https://micro.mamba.pm/api/micromamba/linux-64/latest | tar -xvj bin/micromamba && \
    chmod +x bin/micromamba && \
    bin/micromamba install --yes --root-prefix /opt/mamba xeus-cling

FROM ghcr.io/eoeair/jupyter:py-c

COPY --chown="${NB_UID}:${NB_GID}" --from=builder /opt/mamba /opt/mamba

ENV PATH="/opt/mamba/bin:${PATH}"

USER root

RUN apt-get update --yes && apt-get install --yes g++ && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

USER ${NB_UID}

RUN jupyter kernelspec install /opt/mamba/share/jupyter/kernels/xcpp11 --sys-prefix && \
    jupyter kernelspec install /opt/mamba/share/jupyter/kernels/xcpp14 --sys-prefix && \
    jupyter kernelspec install /opt/mamba/share/jupyter/kernels/xcpp17 --sys-prefix