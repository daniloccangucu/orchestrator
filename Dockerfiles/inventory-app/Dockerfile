# Based on Debian (node:14 image)
FROM node:14

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

EXPOSE 8080
CMD ["node", "src/server.js"]

# inventory-app source code: https://github.com/daniloccangucu/play-with-containers