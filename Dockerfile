#1 phase
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

#2 phase
FROM nginx
#from #1 to #2, ngninx starts html by default
COPY --from=builder /app/build /usr/share/nginx/html

