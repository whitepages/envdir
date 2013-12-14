#
# Cookbook Name:: envdir
# Recipe:: delete
#
# Author:: Philip Champon <philip@adaptly.com>

envdir node[:envdir][:directory] do
  environment node[:envdir][:environment]
  action :delete
end
