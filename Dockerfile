FROM node:20-alpine

ARG UID=1001
ARG GID=1001

WORKDIR /app

RUN addgroup -S -g $GID nodejs && adduser -S -u $UID -G nodejs nextjs

COPY package*.json ./
RUN npm install

COPY . .

RUN chown -R nextjs:nodejs /app

USER nextjs

EXPOSE 3000

CMD ["npm", "run", "dev"]