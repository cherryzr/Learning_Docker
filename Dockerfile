# node docker image already comes with a version of linux with itself
# so we dont include the OS
FROM node:latest

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