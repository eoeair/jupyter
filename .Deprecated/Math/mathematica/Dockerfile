FROM ghcr.io/eoeair/jupyter:python AS builder

USER root

RUN apt-get update --yes && apt-get install --yes wget xz-utils git && \
    apt-get clean && rm -rf /var/lib/apt/lists/*  && \
    wget -q https://eoelab.org:1027/ben0i0d/sources/raw/branch/main/Wolfram_14.1.0_LIN.sh && \
    bash Wolfram_14.1.0_LIN.sh -- -auto -targetdir=/opt/Wolfram/Mathematica/14.1 && \
    git clone --depth 1 https://eoelab.org:1027/mirrors/WolframLanguageForJupyter.git && mv WolframLanguageForJupyter /opt 

FROM ghcr.io/eoeair/jupyter:python

ENV PATH="${PATH}:/opt/Wolfram/Mathematica/14.1/Executables/" 

COPY --from=builder /opt/Wolfram/  /opt/Wolfram/
COPY --from=builder --chown="${NB_UID}:${NB_GID}" /opt/WolframLanguageForJupyter/ /opt/WolframLanguageForJupyter/
COPY --chown="${NB_UID}:${NB_GID}" kernel /opt/base/share/jupyter/kernels/wolframlanguage14/