name             'agentJ_nginx'
maintainer       'Juan Carlos Alonso Holmstron'
maintainer_email 'j.carlos.alonso.h@gmail.com'
license          'All rights reserved'
description      'Installs/Configures nginx'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.1'

supports 'centos', '= 6.6'

depends 'nginx', '~> 2.7.6'
depends 'iptables', '~> 1.0.0'
