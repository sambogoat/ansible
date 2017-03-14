#!/bin/bash

machines="machine1 machine2 machine3"

playbook=$1

ssh_opts=""
for m in $machines 
do
	ssh_opts="$ssh_opts -o IdentityFile=.vagrant/machines/$m/virtualbox/private_key "
done

PYTHONUNBUFFERED=1 ANSIBLE_FORCE_COLOR=true \
ANSIBLE_HOST_KEY_CHECKING=false \
ANSIBLE_SSH_ARGS="-o UserKnownHostsFile=/dev/null -o IdentitiesOnly=yes $ssh_opts -o ControlMaster=auto -o ControlPersist=60s" \
ansible-playbook \
--connection=ssh \
--timeout=30 \
--extra-vars="ansible_ssh_user='vagrant'" \
--limit="all" \
--inventory-file=inventory -v \
$playbook