#!/bin/bash

# Prepare envs
echo ">>>> Preparing envs <<<<"
sed -i 's|;;API_URL;;|'${API_URL}'|g' .env
sed -i 's|;;BASE_URL_WITH_SLASH;;|'${BASE_URL_WITH_SLASH}'|g' .env
sed -i 's|;;ENABLE_LONG_REPLY;;|'${ENABLE_LONG_REPLY}'|g' .env
sed -i 's|;;ENABLE_PWA;;|'${ENABLE_PWA}'|g' .env

# Build frontend
echo ">>>> Installing dependencies <<<<"
npm install -g pnpm
pnpm install
echo ">>>> Building application <<<<"
pnpm build

# Upload build files
current_date=$(date "+%Y_%m_%d_%H:%m")
cd dist
echo ">>>> Packing files <<<<"
tar -zcvf ../dist_${current_date}.tar.gz .
cd ..
if [ -e "dist_${current_date}.tar.gz" ]
then
    echo ">>>> Uploading files <<<<"
    curl --upload-file dist_${current_date}.tar.gz https://transfer.sh/dist_${current_date}.tar.gz -H "Max-Days: 3"
fi
