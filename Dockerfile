FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build
# builds everything into /app/build

# second from statement indicates new block
# nginx starts automatically
FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
