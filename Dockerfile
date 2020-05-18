FROM node:12-slim as meething
RUN apt update && apt install -y build-essential git python-dev python

RUN git clone https://github.com/meething/meething-mediasoup /mediasoup
WORKDIR /mediasoup
RUN npm install

RUN git clone https://github.com/meething/meething /meething
WORKDIR /meething
RUN npm install

RUN git clone https://github.com/meething/gundb-multisocket /multisocket
WORKDIR /multisocket
RUN npm install

RUN mkdir /certs && cd /certs && openssl req -new -newkey rsa:4096 -days 365 -nodes -x509 \
    -subj "/C=US/ST=Denial/L=Springfield/O=Dis/CN=meething.local" \
    -keyout privkey.pem -out fullchain.pem

FROM node:12-slim
WORKDIR /
RUN npm install -g pm2
COPY --from=0 /multisocket /gun
COPY --from=0 /meething /meething
COPY --from=0 /mediasoup /mediasoup
COPY --from=0 /certs /certs
EXPOSE 443/TCP
EXPOSE 2345/TCP
EXPOSE 8765/TCP
CMD ["pm2-docker", "start", "/meething-all.config.js"]
