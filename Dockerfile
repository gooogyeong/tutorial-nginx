# 1. docker build -t myapp:1.0 .
# build docker image, from you can make 3 instances of node.js server
# myapp: name of the app
# . : where to find Dockerfile = current irectory 

# 2. docker run -p 3000:3000 myapp:1.0
# makes an app running inside a container accessible from the outside world 
# -p: Bind the port on your local machine to a port inside the Docker container 

# 3. to create multiple instances, use docker compose,
# which is a tool to simplify the process of defining and running multiple containers 

# Use node base image to have node and pm available  
FROM node:14 

# create folder called app and define it as work directory
WORKDIR /app 

# copy files to work /app folder
COPY server.js .
COPY index.html .
COPY images ./images
COPY package.json .

RUN npm install

EXPOSE 3000

CMD ["node", "server.js"]
