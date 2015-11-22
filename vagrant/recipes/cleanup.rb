#
# DIVUPS
#
# Copyright (c) 2011-2014, DIVUPS, LLC.
#

execute 'delete index.html' do
  command "rm -rf /var/www/index.html"
  action :run
end

execute 'delete html' do
  command "rm -rf /var/www/html"
  action :run
end
