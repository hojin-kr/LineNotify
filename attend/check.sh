#!/bin/bash

# LINE NOTIFY TOKEN
ENV=$(cat ENV)
TOKEN=$(cat LINE_TOKEN | grep ${ENV} | awk '{print $2}')

MESSAGE=""

# STICKER
STICKER_PACKAGE_ID="789"
STICKER_ID="10855"

# check TODAY attend
TODAY=$(date "+%d")

CHECK_0=$(cat check0)
if [ $CHECK_0 = $TODAY ]
then
    NOW=$(date "+%d%H%M")
    # check end before 1hour
    CHECK_1=$(cat check1)
    if [ $CHECK_1 = $NOW ]
    then
        STICKER_PACKAGE_ID="789"
        STICKER_ID="10857"
        MESSAGE="퇴근 한시간 전"
        curl -X POST -H "Authorization: Bearer ${TOKEN}" -F "message=${MESSAGE}" -F "stickerPackageId=${STICKER_PACKAGE_ID}" -F "stickerId=${STICKER_ID}" \
        https://notify-api.line.me/api/notify
    fi

    # check end
    CHECK_2=$(cat check2)
    if [ $CHECK_2 = $NOW ]
    then
        STICKER_PACKAGE_ID="789"
        STICKER_ID="10873"
        MESSAGE="퇴근 지금이야!!"
        curl -X POST -H "Authorization: Bearer ${TOKEN}" -F "message=${MESSAGE}" -F "stickerPackageId=${STICKER_PACKAGE_ID}" -F "stickerId=${STICKER_ID}" \
        https://notify-api.line.me/api/notify
    fi

    CHECK_3=$(cat check3)
    if [ $CHECK_3 = $NOW ]
    then
        STICKER_PACKAGE_ID="789"
        STICKER_ID="10863"
        MESSAGE="퇴근 두시간 전"
        curl -X POST -H "Authorization: Bearer ${TOKEN}" -F "message=${MESSAGE}" -F "stickerPackageId=${STICKER_PACKAGE_ID}" -F "stickerId=${STICKER_ID}" \
        https://notify-api.line.me/api/notify
    fi
fi