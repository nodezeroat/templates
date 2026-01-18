# Ubuntu 24.04
# Python 3.12.3 (3.12.3-0ubuntu2)

###############
# Base system #
###############
FROM docker.io/library/httpd:trixie AS base

ADD --chmod=0755 \
    --checksum=sha256:c125df9762b0c7233459087bb840c0e5dbfc4d9690ee227f1ed8994f4d51d2e0 \
    https://raw.githubusercontent.com/reproducible-containers/repro-sources-list.sh/v0.1.4/repro-sources-list.sh \
    /usr/local/bin/repro-sources-list.sh

RUN repro-sources-list.sh

# Install apt dependencies if needed
RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
        apt-get install -y \
            python3 \
            python3-venv \
            coreutils \
        && \
        apt-get clean

WORKDIR /

# Enable the virtual enviroment
RUN python3 -m venv /.venv
ENV PATH="/.venv/bin:$PATH"

COPY index.html /usr/local/apache2/htdocs/
COPY httpd.conf /usr/local/apache2/conf/httpd.conf
COPY entrypoint.sh /entrypoint.sh

# Install pip dependencies
COPY requirements.txt /app/requirements.txt
RUN pip install --no-cache-dir --upgrade -r /app/requirements.txt 

COPY generate.py /dist/generate.py

CMD ["/entrypoint.sh"]
