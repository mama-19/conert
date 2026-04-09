FROM node:20-alpine

WORKDIR /app

# Create a non-root user
RUN addgroup -S nodejs && adduser -S nextjs -G nodejs

COPY package*.json ./
RUN npm install

COPY . .

# Give ownership of the app dir to nextjs user
RUN chown -R nextjs:nodejs /app

USER nextjs

EXPOSE 3000

CMD ["npm", "run", "dev"]