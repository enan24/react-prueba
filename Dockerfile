FROM node:14.11.0-alpine as builder
WORKDIR /app
COPY package.json /app/package.json
RUN npm install
RUN npm install react-scripts@4.0.1 -g
COPY . /app
RUN npm run build

FROM nginx:1.17.1-alpine
COPY --from=build-step /app/dist/web /usr/share/nginx/html
