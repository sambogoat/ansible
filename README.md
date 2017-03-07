### Docker Compose

docker-machine create --driver virtualbox default

eval $(docker-machine env)

docker-compose run --rm controller udemy.yml -i udemy

### Vagrant

ansible-playbook --private-key=~/.vagrant.d/insecure_private_key -u vagrant -i .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory playbook.yml
