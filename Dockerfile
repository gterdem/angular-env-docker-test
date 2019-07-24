FROM nginx:stable-alpine
LABEL name="gterdem@gmail.com"

ARG API_URL
ARG APP_URL

ENV API_URL=TEMP_API_URL
ENV APP_URL=TEMP_APP_URL

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

ENTRYPOINT ["./entryPoint.sh", "/usr/share/nginx/html/assets/appconfig.production.json"]

# run nginx
CMD ["nginx", "-g", "daemon off;"]