FROM eoelab.org:1027/eoeair/jupyter:py-c AS builder

USER root

RUN apt-get update --yes && apt-get install --yes wget && \
    apt-get clean && rm -rf /var/lib/apt/lists/*  && \
    wget -q https://eoelab.org:1027/ben0i0d/sources/raw/branch/main/Maple2024.2LinuxX64Installer.run && \
    chmod +x Maple2024.2LinuxX64Installer.run && \
    ./Maple2024.2LinuxX64Installer.run --mode unattended --installer-language en --installdir /opt/maple --desktopshortcut 0

FROM eoelab.org:1027/eoeair/jupyter:py-c

ENV PATH="${PATH}:/opt/maple/bin" 

COPY --chown="${NB_UID}:${NB_GID}" kernel /opt/base/share/jupyter/kernels/maple/
COPY --from=builder  /opt/maple /opt/maple