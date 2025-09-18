FROM ghcr.io/eoeair/jupyter:python AS builder

ENV MAMBA_ROOT_PREFIX=/opt/mamba

COPY .condarc /opt/mamba/.condarc

RUN apt-get update --yes && apt-get install --yes curl bzip2 && \
    curl -Ls https://micro.mamba.pm/api/micromamba/linux-64/latest | tar -xvj bin/micromamba && \
    chmod +x bin/micromamba && \
    bin/micromamba install --yes --root-prefix /opt/mamba xeus-cling

FROM ghcr.io/eoeair/jupyter:python

COPY --from=builder /opt/mamba /opt/mamba

ENV PATH="/opt/mamba/bin:${PATH}"

RUN apt-get update --yes && apt-get install --yes g++ && \
    apt-get clean && rm -rf /var/lib/apt/lists/* && \
    jupyter kernelspec install /opt/mamba/share/jupyter/kernels/xcpp11 --sys-prefix && \
    jupyter kernelspec install /opt/mamba/share/jupyter/kernels/xcpp14 --sys-prefix && \
    jupyter kernelspec install /opt/mamba/share/jupyter/kernels/xcpp17 --sys-prefix