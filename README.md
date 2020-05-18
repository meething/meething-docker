<img src="https://i.imgur.com/XS79fTC.png" width=200> <img width="100" alt="mozilla-builders" src="https://user-images.githubusercontent.com/1423657/81992335-85346480-9643-11ea-8754-8275e98e06bc.png">

### meething : docker

This docker container runs the full meething stack for fun and testing.

* [Meething UI](https://github.com/meething/meething) on port 443
* [Meething SFU](https://github.com/meething/meething-mediasoup) on port 2345
* [Meething GUN](https://github.com/meething/gundb-multisocket) on port 8765

#### Build
```
docker build --no-cache -t meething/meething .
```

#### Usage
An example usage of meething with `docker-compose` - just add your TLS certificates in the `/cert` directory
```
version: '2.1'
services:
  meething:
    image: meething/meething:latest
    container_name: meething
    volumes:
      - ./meething-all.config.js:/meething-all.config.js
    environment:
      - SSLCERT=/certs/fullchain.pem
      - SSLKEY=/certs/privkey.pem
    restart: unless-stopped
    ports:
      - 8443:443
      - 2345:2345
      - 8765:8765
    labels:
      org.label-schema.group: "meething"

```
