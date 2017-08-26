#!/bin/sh

cp .env.production .env
cp docker/php/Dockerfile ./ && docker build -t sample/php .
cp docker/web/Dockerfile ./ && docker build -t sample/web .
rm Dockerfile
cp .env.development .env
