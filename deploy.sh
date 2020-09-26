set -e
echo -e "\e[33mDOWN\e[39m"
docker-compose -f docker-compose.yml -f docker-production.yml --context $1 down
echo -e "\e[33mPULL\e[39m"
docker-compose -f docker-compose.yml -f docker-production.yml --context $1 pull
echo -e "\e[33mUP\e[39m"
docker-compose -f docker-compose.yml -f docker-production.yml --context $1 up -d --force-recreate