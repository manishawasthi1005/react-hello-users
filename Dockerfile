FROM node:alpine AS build
WORKDIR /client
COPY package.json .
RUN npm i
COPY . .
RUN npm run build

FROM nginx
COPY --from=build /client/build /user/share/nginx/html

EXPOSE 3000
CMD ["npm", "start"]
