# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "hashicorp/precise64"

  # See https://github.com/mitchellh/vagrant/pull/5765#issuecomment-120247738

  N = 3

  VAGRANT_VM_PROVIDER = "virtualbox"
  ANSIBLE_RAW_SSH_ARGS = []

  (1..N-1).each do |machine_id|
    ANSIBLE_RAW_SSH_ARGS << "-o IdentityFile=.vagrant/machines/machine#{machine_id}/#{VAGRANT_VM_PROVIDER}/private_key"
  end

  (1..N).each do |machine_id|
    config.vm.define "machine#{machine_id}" do |machine|
      machine.vm.hostname = "machine#{machine_id}"
      machine.vm.network "private_network", ip: "192.168.77.#{20+machine_id}"
      if machine_id == N
        machine.vm.provision :ansible do |ansible|
          ansible.verbose = true
          ansible.playbook = "playbook.yml"
          ansible.limit = 'machine1'
          ansible.inventory_path = "inventory"
          ansible.raw_ssh_args = ANSIBLE_RAW_SSH_ARGS
        end
      end
    end
  end

end


#   # Disable the new default behavior introduced in Vagrant 1.7, to
#   # ensure that all Vagrant machines will use the same SSH key pair.
#   # See https://github.com/mitchellh/vagrant/issues/5005
#   config.ssh.insert_key = false

#   config.vm.provision "ansible" do |ansible|
#     ansible.verbose = "v"
#     ansible.playbook = "playbook.yml"
#   end

# end
