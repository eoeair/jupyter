FROM ghcr.io/eoeair/cenv:python

EXPOSE 8888

# Configure environment
ENV NB_USER=root \
    NB_UID=0 \
    NB_GID=0 \
    SHELL=/bin/bash \
    HOME="/root" 

# start script
COPY start-sh/* /usr/local/bin/
# jupyter config (to disable hide files) & healthcheck script
COPY jupyter_server_config.py docker_healthcheck.py /etc/jupyter/
# shell profile , to disable PATH be overwrited by jupyter
COPY profile /etc/

# install base packages
RUN apt-get update --yes && apt-get install --yes --no-install-recommends unzip python3-venv && \
    apt-get clean && rm -rf /var/lib/apt/lists/* && \
    # enhance scripts & repair HEALTHCHECK permission denied
    chmod a+rx /usr/local/bin/* /etc/jupyter/docker_healthcheck.py  && \
    # Create dirs for startup hooks
    mkdir /usr/local/bin/start-notebook.d && mkdir /usr/local/bin/before-notebook.d && \
    # install jupyterlab jupyterhub  extension python-lsp
    pip install 'jupyterlab' 'jupyterhub' && \
    pip install jupyterlab-language-pack-zh-CN jupyterlab-lsp jupyterlab-execute-time jedi-language-server && \
    pip cache purge 

# HEALTHCHECK documentation: https://docs.docker.com/engine/reference/builder/#healthcheck
# This healtcheck works well for `lab`, `notebook`, `nbclassic`, `server`, and `retro` jupyter commands
# https://github.com/jupyter/docker-stacks/issues/915#issuecomment-1068528799
HEALTHCHECK --interval=3s --timeout=1s --start-period=3s --retries=3 \
    CMD /etc/jupyter/docker_healthcheck.py || exit 1

WORKDIR "${HOME}"

# Configure container startup
ENTRYPOINT ["tini", "-g", "--", "start.sh"]
CMD ["start-notebook.py"]