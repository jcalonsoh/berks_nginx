#!/usr/bin/env bash
# Stub install.sh
# TODO: make this smarter, though works

sudo su - root
echo "172.17.100.47 chef-cl.nisum.com" >> /etc/hosts
sudo rpm -ivh /chef/installer/chef-12.3.0-1.el6.x86_64.rpm
sudo mkdir -p /etc/chef/trusted_certs/; sudo rsync -avrPO /chef/trusted_certs/ /etc/chef/trusted_certs/
