module.exports = {
  apps : [{
    name: 'meething',
    script: '/meething/src/app.js',
    watch: './meething/src',
    env : {
      SSL : true,
      SSLKEY : '/certs/privkey.pem',
      SSLCERT  : '/certs/fullchain.pem',
      DEBUG : false
    }
  },{
    name: 'mediasoup',
    script: '/mediasoup/main.js',
    env : {
      SSL : true,
      SSLKEY : '/certs/privkey.pem',
      SSLCERT  : '/certs/fullchain.pem',
      DEBUG : false
    }
  },{
    name: 'gunsocket',
    script: '/gun/server.js',
    env : {
      SSL : true,
      SSLKEY : '/certs/privkey.pem',
      SSLCERT  : '/certs/fullchain.pem',
      PORT : 8765,
      DEBUG : false
    }
  }]
};
