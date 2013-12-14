#
# Cookbook Name:: envdir
# Recipe:: replace
#
# Author:: Philip Champon <philip@adaptly.com>

envdir node[:envdir][:directory] do
  action :create
  environment node[:envdir][:environment]
end
