FROM ubuntu:focal

RUN /usr/bin/apt-get update && \
    /usr/bin/apt-get install -y curl && \
    curl -sL https://deb.nodesource.com/setup_18.x | bash - && \
    /usr/bin/apt-get update && \
    /usr/bin/apt-get upgrade -y && \
    /usr/bin/apt-get install -y nodejs ffmpeg

WORKDIR /home/app

COPY package*.json ./

RUN npm install
RUN npm install -g nodemon
COPY . .

CMD ["nodemon", "index.js"]