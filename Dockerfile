# specify a base image from pre-existing repo 'node' inside docker hub. Alpine is an existing tag in node image that u can find out from list of tags in docker hub's node image
FROM node:alpine

#defining a work directory so that all my files are copied inside /usr/app inside the container
#this is used because it is not a good preactice to save everything in root directory of the container
WORKDIR /usr/app

#additional command to include the .json file while running npm install.
#including only .json so that any changes made to .js doesn't need a re-build and installation of all npm dependencies.
#copy from current directory of nodejswebapp to the WORKDIR of image-container
COPY ./package.json ./

#install dependencies
RUN npm install

#copy everything else to WORKDIR, including index.js
COPY ./ ./

#default command
CMD ["npm", "start"]
