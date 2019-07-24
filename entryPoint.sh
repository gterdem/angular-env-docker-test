#!/bin/sh

echo "ENV Api Url Passed in: $API_URL"
echo "ENV App Url Passed in: $APP_URL"

tmp=$(mktemp)
jq --arg API_URL "$API_URL" '.remoteServiceBaseUrl = "\($API_URL)"' $FILE_PATH > "$tmp" && mv "$tmp" $FILE_PATH
jq --arg APP_URL "$APP_URL" '.appBaseUrl = "\($APP_URL)"' $FILE_PATH > "$tmp" && mv "$tmp" $FILE_PATH

echo "New API_URL:" $(jq -r '.remoteServiceBaseUrl' $FILE_PATH)
echo "New APP_URL:" $(jq -r '.appBaseUrl' $FILE_PATH)

exec "$@"