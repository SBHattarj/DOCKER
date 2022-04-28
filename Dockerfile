FROM gitpod/workspace-full-vnc:branch-jx-ubuntu-focal

RUN apt-get update \
    && export DEBIAN_FRONTEND=noninteractive \
    && curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo bash \
    && sudo apt-get install git-lfs \
    && apt-get install -y qemu-system mkisofs \
    && apt-get clean && rm -rf /var/cache/apt/* && rm -rf /var/lib/apt/lists/* && rm -rf /tmp/* \
    && cd /home/gitpod/.pyenv/plugins/python-build/../.. && git pull && cd - \
    && pyenv install 3.10.2 && pyenv local 3.10.2 \
    && pip install pygame mypy numpy \
