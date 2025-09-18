FROM ghcr.io/eoeair/jupyter:python

RUN apt-get update --yes && \
    apt-get install --yes --no-install-recommends \
      dbus-x11 \
      xfce4 xterm \
      tigervnc-standalone-server websockify && \
    apt-get clean && rm -rf /var/lib/apt/lists/* && \
    pip install jupyter-remote-desktop-proxy && \
    pip cache purge 