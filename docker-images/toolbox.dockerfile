FROM temp/toolbox
ARG KUBERNETES_RELEASE
ARG DOCKER_RELEASE
ARG COMPOSE_RELEASE
ARG JQ_RELEASE
ARG EASYRSA_RELEASE
ENV DOCKER_HOST=unix:///docker.sock
ADD toolbox /etc/toolbox
ADD toolbox-configure.sh /tmp/toolbox-configure.sh
RUN /tmp/toolbox-configure.sh
WORKDIR /etc/toolbox/resources
