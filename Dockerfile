#this is multi-build dockerfile used for production env
#nginx is a web-server that serves our browser request and response by networking and routing it with static files
FROM node:alpine as builder #tag this phase with a name builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

#/app/build <-- will have everything that is built

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html #copy output of builder phase from src to dest directory
#here we dont need CMD coz nginx has a default command that will run to start nginx container
