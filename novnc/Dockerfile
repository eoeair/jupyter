FROM ghcr.io/eoeair/jupyter:python

USER root

RUN apt-get update --yes && \
    apt-get install --yes --no-install-recommends \
      dbus-x11 \
      xfce4 xterm \
      tigervnc-standalone-server websockify && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

USER $NB_USER

RUN pip install jupyter-remote-desktop-proxy && \
    pip cache purge 