#
# jcloud-blockchain client
#
FROM        node:7.10-alpine
LABEL       vendor="shiying"                             \
            version="1.7"
ENV         SERVER_LISTEN_PORT=${SERVER_LISTEN_PORT:-'8081'}
COPY        jcloud-blockchain /jcloud-blockchain
RUN         apk update &&                                \
            apk --no-cache add bash git vim make gcc g++ python paxctl gnupg libc6-compat &&    \
            cd /jcloud-blockchain &&                     \
            npm build &&                                 \
            npm install &&                               \
            chmod +x server.js &&                        \
            chmod +x verify.js &&                        \
            rm -rf /var/cache/apk/*
EXPOSE      ${SERVER_LISTEN_PORT}
ENTRYPOINT  ["/jcloud-blockchain/server.js"]