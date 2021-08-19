FROM node:alpine as builder

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

RUN npm run build


FROM nginx

#from=phase from to
COPY --from=builder /app/build /usr/share/nginx/html

# default command vom nginx image startet nginx automatisch