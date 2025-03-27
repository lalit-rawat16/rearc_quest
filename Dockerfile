FROM --platform=linux/amd64 node:10
ENV SECRET_WORD=TwelveFactor

RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app
WORKDIR /home/node/app

COPY package.json ./

USER node

RUN npm install

COPY --chown=node:node . .

EXPOSE 8080

CMD [ "node", "src/000.js"]