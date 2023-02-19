FROM node:lts-alpine3.17 as build
WORKDIR /app
COPY . /app/
RUN npm install && npm run build

FROM nginx:latest
COPY --from=build /app/build /usr/share/nginx/html