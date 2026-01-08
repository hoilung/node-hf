FROM node:20-alpine3.20

WORKDIR /tmp

COPY index.js index.html package.json ./

RUN npm install -g terser

RUN npx terser index.js -o index.min.js

EXPOSE 7860

RUN apk update && apk add --no-cache bash openssl curl &&\
    chmod +x index.js &&\
    npm install

CMD ["node", "index.min.js"]
