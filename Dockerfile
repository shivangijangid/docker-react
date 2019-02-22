# specify a base image
FROM node:alpine

#specifying work directory to be used inside container
WORKDIR /usr/app

#copy the files inside container
COPY ./package.json ./

#install dependencies
RUN npm install
COPY ./ ./

#default command
CMD ["npm", "start"]