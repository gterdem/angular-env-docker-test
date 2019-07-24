FROM nginx:stable-alpine
LABEL name="gterdem@gmail.com"

ARG API_URL
ARG APP_URL

ENV FILE_PATH="/usr/share/nginx/html/assets/appconfig.production.json"

# TO use Jq in alpine image
RUN apk update \
    && apk add jq \
    && rm -rf /var/cache/apk/*

COPY nginx.conf /etc/nginx/nginx.conf

WORKDIR /usr/share/nginx/html
COPY dist/angular-env-docker-test/ .

# Copy the EntryPoint
COPY entryPoint.sh .
RUN chmod +x entryPoint.sh

ENTRYPOINT ["./entryPoint.sh"]

# run nginx
CMD ["nginx", "-g", "daemon off;"]