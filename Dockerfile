FROM coppertopgeoff/servicebase:edge

EXPOSE 5000

USER root

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y -q \
        socat           \
    && rm -rf /var/lib/apt/lists/*

COPY --chown=service:service ./src/start.sh /usr/app/src/start.sh

USER service

#Install Octoprint
RUN git clone https://github.com/OctoPrint/OctoPrint.git /usr/app/octoprint \
    && ./venv/bin/pip install /usr/app/octoprint
