#!/bin/bash

# ENV
name=$(awk -F "=" 'NR==6 { print $2 }' .env)

# Initialize docker
docker-compose up -d

# Show running containers
docker ps

# Test connection to the other containers with docker exec and directly execute ssh
echo "=============================="
echo "Testing connection from [1] dev-web-$name to [2] dev-api-$name:"
docker exec -it dev-web-$name ssh root@dev-api-$name -oStrictHostKeyChecking=no 'echo \"I am in container $(hostname) - api\" ; sleep 2 >/dev/null &'

echo "=============================="
echo "Testing connection from [2] dev-api-$name to [3] dev-web-$name:"
docker exec -it dev-api-$name ssh root@dev-db-$name -oStrictHostKeyChecking=no 'echo \"I am in container $(hostname) - db\" ; sleep 2 >/dev/null &'

echo "=============================="
echo "Testing connection from [1] dev-web-$name to [3] dev-db-$name:"
docker exec -it dev-web-$name ssh root@dev-db-$name -oStrictHostKeyChecking=no 'echo \"I am in container $(hostname)\" ; sleep 2 >/dev/null &'