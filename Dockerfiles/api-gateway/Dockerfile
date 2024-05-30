# Based on Debian (node:14 image)
FROM node:14

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

RUN mkdir -p /var/log/api-gateway && chown -R ${NODE_USER}:${NODE_USER} /var/log/api-gateway

USER ${NODE_USER}

EXPOSE 3000

CMD ["node", "server.js"]

# api-gateway source code: https://github.com/daniloccangucu/play-with-containers
