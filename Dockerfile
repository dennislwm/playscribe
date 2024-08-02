#----------------------
# From linux base image
FROM python:3.12.2-slim AS layer_base

#----------------------
# Update system
#   Clean up temp files
#   Create a non-root user
FROM layer_base AS layer_user
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        git \
        build-essential \
        ffmpeg \
        sudo\
    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean \
    && useradd --create-home appuser \
    && echo "appuser ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/appuser \
    && chmod 0440 /etc/sudoers.d/appuser

# Switch to the non-root user
USER appuser

# Set up work directory
WORKDIR /home/appuser/app

#----------------------
# Set file permissions for the app directory
RUN chmod -R 755 /home/appuser/app

#----------------------
# Install pipx
FROM layer_user AS layer_pipx
RUN python3 -m pip install --upgrade pip \
    && python3 -m pip install --user pipx \
    && python3 -m pipx ensurepath

#----------------------
# Install fabric
#   Clone git repo
#   Install fabric
#   Remove git repo
FROM layer_pipx AS layer_fabric
RUN git clone https://github.com/danielmiessler/fabric.git \
    && python3 -m pipx install ./fabric \
    && rm -rf ./fabric

#----------------------
# Final layer_pipx
#   Copy layer_fabric
#   Setup fabric
FROM layer_pipx
COPY --from=layer_fabric /home/appuser/.local /home/appuser/.local

RUN  yes "" | ~/.local/bin/fabric --setup \
    && echo DEFAULT_MODEL=gpt-4o-mini >> ~/.config/fabric/.env \
    && export PATH=${PATH}:~/.local/share/pipx/venvs/fabric/bin/

#-------------------------------------
# Set default script and arguments
#   This can be overridden at runtime
ENTRYPOINT ["/home/appuser/.local/share/pipx/venvs/fabric/bin/fabric"]