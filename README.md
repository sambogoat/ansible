docker-machine create --driver virtualbox default

eval $(docker-machine env)

docker-compose run --rm controller udemy.yml -i udemy
