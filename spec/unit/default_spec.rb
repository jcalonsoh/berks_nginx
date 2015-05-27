#
# Cookbook Name:: agentJ_nginx
# Recipe:: default
# ChefSpec:: Unit Test
# Copyright (C) 2015 Juan Carlos Alonso Holmstron
#
# All rights reserved - Do Not Redistribute
#

require File.expand_path('spec/spec_helper')

describe 'agentJ_nginx::default' do
  let(:chef_run) do
    runner = ChefSpec::SoloRunner.new(
        platform: 'centos', version: '6.6'
    )
    runner.converge(described_recipe)
  end

  before('Test') do
    stub_command('which nginx').and_return('/usr/sbin/nginx')
    stub_command('which httpd').and_return('/usr/sbin/httpd')
  end

  context 'Validating included recipes' do
    it 'includes the `nginx` recipe' do
      expect(chef_run).to include_recipe('nginx::default')
    end

    it 'does not include the `not` recipe httpd' do
      expect(chef_run).to_not include_recipe('httpd::default')
    end
  end

  context 'Installing PHP to nginx' do
    it 'Test install php-fpm' do
      expect(chef_run).to install_package('php-fpm')
    end
  end

  context 'Enabling and Starting Nginx & PHP_FPM' do
    it 'Test starts a service nginx' do
      expect(chef_run).to_not start_service('httpd')
      expect(chef_run).to start_service('nginx')
    end

    it 'Test starts a service php-fpm' do
      expect(chef_run).to start_service('php-fpm')
    end
  end

  context 'Paasing throught cookbook files configuration and index for webserver' do
    it 'Test creates a cookbook_file nginx default configuration' do
      expect(chef_run).to create_cookbook_file('/etc/nginx/conf.d/default.conf').with(
                              user:   'nginx',
                              group:  'nginx'
                          )
    end

    it 'Test creates a cookbook_file nginx default index.php to view' do
      expect(chef_run).to create_cookbook_file('/usr/share/nginx/html/index.php').with(
                              user:   'nginx',
                              group:  'nginx'
                          )
    end
  end

end
