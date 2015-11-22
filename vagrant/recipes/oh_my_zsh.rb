#
# Ken Iovino
#
# Copyright (c) 2011-2014, DIVUPS, LLC.
#

package "zsh"
include_recipe "git"

home_directory = `cat /etc/passwd | grep "#{node['oh_my_zsh']['login']}" | cut -d ":" -f6`.chop

git "#{home_directory}/.oh-my-zsh" do
  repository 'git://github.com/robbyrussell/oh-my-zsh.git'
  user node['oh_my_zsh']['login']
  reference "master"
  action :sync
end

template "#{home_directory}/.zshrc" do
  source "zshrc.erb"
  owner node['oh_my_zsh'][:login]
  mode "644"
  variables({
    :user           => node['oh_my_zsh']['login'],
    :theme          => node['oh_my_zsh']['theme'] || 'robbyrussell',
    :case_sensitive => node['oh_my_zsh']['case_sensitive'] || false,
    :plugins        => node['oh_my_zsh']['plugins']
  })
end

user node['oh_my_zsh']['login'] do
  action :modify
  shell '/bin/zsh'
end

execute "source /etc/profile to all zshrc" do
  command "echo 'source /etc/profile' >> /etc/zsh/zprofile"
  not_if "grep 'source /etc/profile' /etc/zsh/zprofile"
end