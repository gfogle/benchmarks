FROM ghcr.io/graalvm/graalvm-ce:ol8-java17-22.0.0.2

RUN gu install nodejs

WORKDIR /web

COPY package.json .
RUN npm install

COPY src src/

CMD ["node", "src/index.js"]
