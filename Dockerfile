FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN yarn install
COPY . .
RUN yarn build
RUN ls .

FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html