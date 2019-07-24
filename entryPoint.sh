#!/bin/sh
echo "ENV Api Url Passed in: $API_URL"
echo "ENV App Url Passed in: $APP_URL"

# oldApiUrl="TEMP_API_URL"
# newApiUrl=$API_URL

# oldAppUrl="TEMP_BASE_URL"
# newAppUrl=$APP_URL

# sed -i s,$oldApiUrl,$newApiUrl,g "/usr/share/nginx/html/assets/appconfig.production.json"
# sed -i s,$oldAppUrl,$newAppUrl,g "/usr/share/nginx/html/assets/appconfig.production.json"

# exec "$@"

tmp=$(mktemp)
jq --arg API_URL "$API_URL" '.remoteServiceBaseUrl = "\($API_URL)"' $1 > "$tmp" && mv "$tmp" $1
jq --arg APP_URL "$APP_URL" '.appBaseUrl = "\($APP_URL)"' $1 > "$tmp" && mv "$tmp" $1

echo "New API_URL:" $(jq -r '.remoteServiceBaseUrl' $1)
echo "New APP_URL:" $(jq -r '.appBaseUrl' $1)

exec "${@:2}"