#
# Ken Iovino
#
# Copyright (c) 2011-2014, DIVUPS, LLC.
#

include_recipe "apache2"
include_recipe "apache2::mod_rewrite"
include_recipe "apache2::mod_ssl"
include_recipe "apache2::mod_php5"

web_app node['hostname'] do
  template "site.conf.erb"
  server_name node['hostname']
  docroot node['apache']['docroot_dir']
end

bash "hosts" do
  code "echo 127.0.0.1 #{node['hostname']} >> /etc/hosts"
end







