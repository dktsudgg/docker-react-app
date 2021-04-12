FROM node:alpine AS studyAppBuilder
WORKDIR '/usr/src/app'
COPY package.json .
RUN npm install
COPY ./ ./
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=studyAppBuilder /usr/src/app/build /usr/share/nginx/html
