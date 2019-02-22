# specify a base image
FROM node:alpine as builder

#specifying work directory to be used inside container
WORKDIR '/app'

#copy the files inside container
COPY package.json .

#install dependencies
RUN npm install
COPY . .
RUN npm run build

#default command
#CMD ["npm", "start"]
FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html