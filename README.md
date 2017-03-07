### Docker Compose

docker-machine create --driver virtualbox default

eval $(docker-machine env)

docker-compose run --rm controller udemy.yml -i udemy

### Vagrant

http://docs.ansible.com/ansible/guide_vagrant.html

ansible-playbook --private-key=~/.vagrant.d/insecure_private_key -u vagrant -i .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory playbook.yml

PYTHONUNBUFFERED=1 ANSIBLE_FORCE_COLOR=true ANSIBLE_HOST_KEY_CHECKING=false ANSIBLE_SSH_ARGS='-o UserKnownHostsFile=/dev/null -o IdentitiesOnly=yes -i '/Users/steve/workspace/ansible/.vagrant/machines/machine3/virtualbox/private_key' -o IdentityFile=.vagrant/machines/machine1/virtualbox/private_key -o IdentityFile=.vagrant/machines/machine2/virtualbox/private_key -o ControlMaster=auto -o ControlPersist=60s' ansible-playbook --connection=ssh --timeout=30 --extra-vars="ansible_ssh_user='vagrant'" --limit="machine1" --inventory-file=inventory -v playbook.yml