# Ubuntu 24.04
# Python 3.12.3 (3.12.3-0ubuntu2)

###############
# Base system #
###############
FROM docker.io/library/ubuntu:noble-20251013 AS base

ADD --chmod=0755 \
    --checksum=sha256:c125df9762b0c7233459087bb840c0e5dbfc4d9690ee227f1ed8994f4d51d2e0 \
    https://raw.githubusercontent.com/reproducible-containers/repro-sources-list.sh/v0.1.4/repro-sources-list.sh \
    /usr/local/bin/repro-sources-list.sh

RUN repro-sources-list.sh

# Install apt dependencies if needed
RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y python3 python3-venv socat coreutils && apt-get clean

# Enable the virtual enviroment
RUN python3 -m venv /.venv
ENV PATH="/.venv/bin:$PATH"

# Install pip dependencies
COPY requirements.txt /app/requirements.txt
RUN pip install --no-cache-dir --upgrade -r /app/requirements.txt 

#################
# Runner system #
#################
# Opensuse Tumbleweed (only for running nsjail)
FROM docker.io/opensuse/tumbleweed@sha256:404df0954fda18f5d823ed520a41ff6e60d7ab00b2ef688477b679c2ff742560 

# Install apk dependencies if needed
RUN zypper -n install nsjail fakeroot && zypper -n clean --all

# Copy base filesystem
COPY --from=base / /jail

# Copy challenge required files
RUN mkdir -p /jail/app
COPY challenge.py /jail/app/challenge.py
RUN chmod +x /jail/app/challenge.py
COPY setup_entrypoint.sh /setup_entrypoint.sh
COPY entrypoint.sh /jail/app/entrypoint.sh

SHELL ["/bin/sh", "-c"]
CMD ["/setup_entrypoint.sh"]