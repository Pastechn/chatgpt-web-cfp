#!/bin/bash

# Prepare envs
sed -i 's|;;API_URL;;|'${API_URL}'|g' .env
sed -i 's|;;BASE_URL_WITH_SLASH;;|'${BASE_URL_WITH_SLASH}'|g' .env
sed -i 's|;;ENABLE_LONG_REPLY;;|'${ENABLE_LONG_REPLY}'|g' .env
sed -i 's|;;ENABLE_PWA;;|'${ENABLE_PWA}'|g' .env
cat .env

# Build frontend
npm install -g pnpm
pnpm install
pnpm build
