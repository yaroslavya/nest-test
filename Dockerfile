#    Build image:
#    docker build -t nestest:v0.1 .
#
#    Run image (on localhost:3000):
#    docker run --name nestest -p 3000:3000 nestest:v0.1

#FROM node:alpine
FROM node:latest

COPY package.json ./

## Storing node modules on a separate layer will prevent unnecessary npm installs at each build
RUN npm i && npm i --dev && mkdir /code && mv ./node_modules ./code
#RUN mkdir -p /code
COPY . /code

WORKDIR /code

RUN npm i -g nodemon@1.18.3

EXPOSE 3000

CMD ["npm", "run", "start:dev"]