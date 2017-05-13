#
# jcloud-blockchain client
#
FROM        node:6.10.3-alpine
LABEL       version="jcloud-blockchain:1.7"
ENV         SERVER_LISTEN_PORT=${SERVER_LISTEN_PORT:-'8081'} \
            NPM_CONFIG_LOGLEVEL=info                         \
            NODE_VERSION=6.10.3
COPY        jcloud-blockchain /jcloud-blockchain
RUN         apk update &&                                \
            apk --no-cache add bash git vim paxctl xz-utils python-dev bzip2 libc6-compat &&    \
            cd /jcloud-blockchain &&                     \
            npm build &&                                 \
            npm install -g es6-promise-pool &&           \
            npm install -g gulp &&                       \
            npm install -g grpc &&                       \
            npm install -g node-gyp &&                   \
            npm install -g hashtable &&                  \
            npm install &&                               \
            chmod +x standalone-server.js &&             \
            chmod +x verify.js &&                        \
            rm -rf /var/cache/apk/*
EXPOSE      ${SERVER_LISTEN_PORT}
WORKDIR     /jcloud-blockchain
ENTRYPOINT  ["/jcloud-blockchain/standalone-server.js"]