FROM node:16
WORKDIR /app
COPY package.json /app
RUN yarn
COPY . /app
RUN apt-get update && apt-get install -y ssh sudo net-tools
ADD ./entrypoint-app.sh /entrypoint-app.sh
RUN sudo chmod +x /entrypoint-app.sh
ENTRYPOINT [ "/entrypoint-app.sh" ]

