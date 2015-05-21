#
# Cookbook Name:: agentJ_nginx
# Recipe:: default
# ServerSpec:: web1
# Copyright (C) 2015 Juan Carlos Alonso Holmstron
#
# All rights reserved - Do Not Redistribute
#

require 'serverspec'
set :backend, :exec
set :os, :family => 'redhat', :release => '6', :arch => 'x86_64'

context 'agentJ_nginx::default' do
  describe package('php-fpm') do
    it { should be_installed }
  end

  describe service('php-fpm') do
    it { should be_enabled }
  end

  describe service('php-fpm') do
    it { should be_running }
  end

  describe process('php-fpm') do
    its(:user) { should eq 'root' }
  end

  describe file('/etc/nginx/conf.d/default.conf') do
    it { should be_file }
  end

  describe file('/usr/share/nginx/html/index.php') do
    it { should be_file }
  end
end