# Starting from Node.js 17, OpenSSL 3.0 was introduced, which caused compatibility issues with 
# some libraries that rely on older cryptographic methods. This is causing the error ERR_OSSL_EVP_UNSUPPORTED.
# To fix this, we can try one of the following solutions:
# Use Legacy OpenSSL by the following command "ENV NODE_OPTIONS=--openssl-legacy-provider"
# or we can downgrade our node version to match compatibility settings like node:16


# node docker image already comes with a version of linux with itself
# so we dont include the OS
FROM node:latest

# Set the environment variable to enable legacy OpenSSL support
ENV NODE_OPTIONS=--openssl-legacy-provider

# making our work directory
# the p flag creates the app and the src folder
RUN mkdir -p /app/src

# setting up our working directory
WORKDIR /app/src

# we are gonna copy the package.json and then run npm install
# to install all dependencies specified in the json file
COPY package.json .

# run npm install to get out node modules set up
RUN npm install

# now we copy our entire app to that folder
COPY . .

# react uses in development the port 3000, so we expose that as well
EXPOSE 3000

# now we simply run the command "npm start"
CMD [ "npm", "start" ]

# we run the this command to build the docker image: "docker build . -t youtube_react_app"
# t here is the tag we can give to our image and with that we are done building our image


# now that we have built your image, where is it? how do i find my image??
# we can do two things:
# run "docker images" to list out all the images and find it, the latest image will be at the top with the tag you have entered.
# we can also explore the images tag in docker extension in visual studio code

# we can remove any unnecessary image by running this command: "docker rmi 9f1c05b7bbdb"

# upon finding the image we can right click it and run/run interactive