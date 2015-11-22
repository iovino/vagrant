#
# DIVUPS
#
# Copyright (c) 2011-2014, DIVUPS, LLC.
#

# apache defaults
default['apache']['docroot_dir'] = '/var/www/public'

# oh my zsh defaults
default['oh_my_zsh'] = {
  'login'   => 'vagrant',
  'theme'   => 'blinks',
  'plugins' => ['git', 'gem']
}

# mysql
default['mysql']['server_root_password'] = ''

# mailcatcher
default['mailcatcher']['bin']       = '/usr/bin/env catchmail'
default['mailcatcher']['http-ip']   = '0.0.0.0'
default['mailcatcher']['http-port'] = 1080
default['mailcatcher']['smtp-ip']   = '192.168.2.42'
default['mailcatcher']['smtp-port'] = 1025