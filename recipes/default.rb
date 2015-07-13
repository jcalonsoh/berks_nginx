#
# Cookbook Name:: agentJ_nginx
# Recipe:: default
#
# Copyright (C) 2015 Juan Carlos Alonso Holmstron
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'iptables::default'

iptables_rule 'http' do
  action :enable
end

include_recipe 'nginx::default'

package 'php-fpm' do
  action :install
end

service 'php-fpm' do
  action [:enable, :start]
end

cookbook_file "#{node['nginx']['dir']}/conf.d/default.conf" do
  source 'default.conf'
  owner node['nginx']['user']
  group node['nginx']['group']
  mode '0755'
  action :create
end

service 'nginx' do
  action [:enable, :start]
end

cookbook_file '/usr/share/nginx/html/index.php' do
  source 'index.php'
  owner node['nginx']['user']
  group node['nginx']['group']
  mode '0755'
  action :create
end
