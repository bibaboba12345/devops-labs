FROM node:20-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY webpack.config.js ./
COPY server.js ./
COPY /src/* ./src/ 
RUN npm run build


FROM node:20-alpine
WORKDIR /app

COPY --from=builder /app/package*.json ./
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/public ./public
COPY --from=builder /app/server.js ./

RUN chown -R node:node /app
USER node

CMD ["node", "server.js"]
