FROM node:18-alpine
WORKDIR /app
COPY . .
RUN npm install
RUN apk add --no-cache --virtual .build-deps gcc g++ make python3 && \
    npm install && \
    npm rebuild sqlite3 && \
    apk del .build-deps
CMD ["node", "src/index.js"]
EXPOSE 3000