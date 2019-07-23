#!/bin/sh
echo "ENV Api Url Passed in: $API_URL"
echo "ENV App Url Passed in: $APP_URL"

oldApiUrl="TEMP_API_URL"
newApiUrl=$API_URL

oldAppUrl="TEMP_BASE_URL"
newAppUrl=$APP_URL

sed -i s,$oldApiUrl,$newApiUrl,g "/usr/share/nginx/html/assets/appconfig.production.json"
sed -i s,$oldAppUrl,$newAppUrl,g "/usr/share/nginx/html/assets/appconfig.production.json"

exec "$@"