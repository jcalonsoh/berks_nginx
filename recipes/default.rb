#
# Cookbook Name:: agentJ_nginx
# Recipe:: default
#
# Copyright (C) 2015 Juan Carlos Alonso Holmstron
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'nginx::default'

package 'php-fpm'

service 'php-fpm' do
  action [:enable, :start]
end

cookbook_file '/etc/nginx/conf.d/default.conf' do
  source 'default.conf'
  owner 'nginx'
  group 'nginx'
  mode '0755'
  action :create
end

service 'nginx' do
  action [:enable, :start]
end

cookbook_file '/usr/share/nginx/html/index.php' do
  source 'index.php'
  owner 'nginx'
  group 'nginx'
  mode '0755'
  action :create
end
