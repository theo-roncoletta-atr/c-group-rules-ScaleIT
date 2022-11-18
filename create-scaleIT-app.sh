#!/bin/sh

echo "=== moving into the test-app directory ==="
cd test-app || exit

echo "=== building docker test-app image ==="
docker build -t scaleit/test-app:local .

echo "=== moving into the scaleit-app directory ==="
cd ../scaleit-app || exit

echo "=== saving the created image ==="
docker save -o docker/test-app.tar scaleit/test-app:local

echo "=== package generated images into zip ==="
zip -r ../test-app_local.zip docker docker-compose.yml config.yml README.md


