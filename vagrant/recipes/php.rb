#
# DIVUPS
#
# Copyright (c) 2011-2014, DIVUPS, LLC.
#

include_recipe "php"

begin
  t = resources("template[#{node['php']['conf_dir']}/php.ini]")
  t.source "php.ini.erb"
  t.cookbook "divups"
rescue Chef::Exceptions::ResourceNotFound
  Chef::Log.warn "could not find template your template override!"
end

#
# Download & Install PHP Packages
#
# You can find a list of supported packages here:
#   @see http://packages.ubuntu.com/
#
# Example Usage:
#
#   package "page-name" do
#     action :install
#     version "0.0.0"
#     ...
#   end
#

package "php5-xsl" do
  action :install
end

package "php5-mysql" do
  action :install
end

package "php5-memcache" do
  action :install
end

package "php5-curl" do
  action :install
end

package "php5-mcrypt" do
  action :install
end

package "php5-json" do
  action :install
end

package "php5-xdebug" do
    action :install
end

package "php5-gd" do
    action :install
end

#
# mcrypt and xdebug need to be enabled
#

execute 'php5enmod mcrypt' do
  command "/usr/sbin/php5enmod mcrypt"
  action :run
end

execute 'php5enmod xdebug' do
  command "/usr/sbin/php5enmod xdebug"
  action :run
end

#
# Copy cli php.ini file to apache2 folder
#

execute 'copy php.ini' do
  command "sudo cp /etc/php5/cli/php.ini /etc/php5/apache2/php.ini"
  action :run
end



