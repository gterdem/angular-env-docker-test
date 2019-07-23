FROM nginx:stable-alpine
LABEL name="gterdem@gmail.com"

ARG API_URL
ARG APP_URL

ENV API_URL=TEMP_API_URL
ENV APP_URL=TEMP_APP_URL

COPY nginx.conf /etc/nginx/nginx.conf

WORKDIR /usr/share/nginx/html
COPY dist/test-app/ .

# Copy the EntryPoint
COPY entryPoint.sh .
RUN chmod +x entryPoint.sh

ENTRYPOINT ["./entryPoint.sh"]

# run nginx
CMD ["nginx", "-g", "daemon off;"]