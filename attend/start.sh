#!/bin/bash

# LINE NOTIFY TOKEN
ENV=$(cat ENV)
TOKEN=$(cat LINE_TOKEN | grep ${ENV} | awk '{print $2}')

MESSAGE=""

# START
STICKER_PACKAGE_ID="789"
STICKER_ID="10856"
MESSAGE=$(date "+%d일 %H시 %M분 %S초")

echo $(date "+%d") > check0
echo $(date -v +8H "+%d일%H시%M분") > check1
echo $(date -v +9H "+%d일%H시%M분") > check2
echo $(date -v +7H "+%d일%H시%M분") > check3

curl -X POST -H "Authorization: Bearer ${TOKEN}" -F "message=${MESSAGE}" -F "stickerPackageId=${STICKER_PACKAGE_ID}" -F "stickerId=${STICKER_ID}" \
https://notify-api.line.me/api/notify