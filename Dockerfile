FROM node:alpine
WORKDIR '/app'
COPY package.json .
RUN chgrp -R 0 /some/directory && \
    chmod -R g+rwX /some/directory
RUN npm install
COPY . .
CMD ["npm", "start"]
