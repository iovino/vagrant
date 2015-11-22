#
# DIVUPS
#
# Copyright (c) 2011-2014, DIVUPS, LLC.
#

name             'divups'
maintainer       'DIVUPS'
maintainer_email 'hello@divups.com'
license          'All rights reserved'
description      'Installs and configures DIVUPS boxes'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.0.1'

#
# Dependencies
#
depends "apt"
depends "build-essential"
depends "git"
depends "apache2"
depends "mysql"
depends "php"
depends "composer"
depends "nodejs"
depends "phing"
depends "php-box"
depends "xdebug"