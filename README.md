# jcloud-blockchain-dockerfile

Dockerfile for building docker image from node:7.10-alpine

## folder structure

```bash
.\----+---files\
      |---build.sh        # build docker image
      |---Dockerfile
      |---LICENSE
      |---README.md
      |---run-demo        # run demo instance from image build by build.sh
```

## Environment variables

```bash
SERVER_LISTEN_PORT=8081  # default port for server.js is 8081
```

## Modifications from [shiying/jcloud-blockchain](http://103.237.5.178:3000/shiying/jcloud-blockchain.git)

```bash
files\ ~= jcloud-blockchain
```

- `server.js` under files change `PORT` to `SERVER_LISTEN_PORT` and add `#!/usr/bin/env node` to make `server.js` can be run by `./server.js`

- `verify.js` is copy from `testapp.js` with `#!/usr/bin/env node`