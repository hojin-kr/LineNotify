#!/bin/bash

TOKEN=""
MESSAGE=""

# START
START_STIKCER_PACKAGE_ID="446"
START_STIKCER_ID="1988"
MESSAGE=$(date "+%I시 %M분 %S초")
curl -X POST -H "Authorization: Bearer ${TOKEN}" -F "message=${MESSAGE}" -F "stickerPackageId=${START_STIKCER_PACKAGE_ID}" -F "stickerId=${START_STIKCER_ID}" \
https://notify-api.line.me/api/notify
