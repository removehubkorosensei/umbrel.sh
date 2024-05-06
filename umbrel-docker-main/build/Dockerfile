FROM debian:stable-slim

ENV INSTALL_PATH=/root/umbrel

RUN apt-get -y update && apt-get -y install sudo curl iproute2

RUN curl -L https://umbrel.sh | bash -s -- \
    --bootstrapped \
    --no-install-umbrel

COPY ./entrypoint.sh entrypoint.sh

ENTRYPOINT [ "./entrypoint.sh" ]

CMD [ "scripts/start" ]