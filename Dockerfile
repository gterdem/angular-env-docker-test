FROM nginx:stable-alpine
# To use bin/bash shebang Bash-script
# FROM nginx:stable
LABEL name="gterdem@gmail.com"

ARG API_URL
ARG APP_URL

ENV API_URL=TEMP_API_URL
ENV APP_URL=TEMP_APP_URL

# TO use Jq in alpine image
# RUN apk update \
#     && apk add jq \
#     && rm -rf /var/cache/apk/*

# When Bash-script is used
# RUN apt-get update && apt-get install -y jq

COPY nginx.conf /etc/nginx/nginx.conf

WORKDIR /usr/share/nginx/html
COPY dist/angular-env-docker-test/ .

# Copy the EntryPoint
COPY entryPoint.sh .
RUN chmod +x entryPoint.sh

ENTRYPOINT ["./entryPoint.sh"]
# When Bash-script is used
# ENTRYPOINT ["./entrypoint-bash.sh", "/usr/share/nginx/html/assets/appconfig.production.json"]

# run nginx
CMD ["nginx", "-g", "daemon off;"]