#
# Cookbook Name:: envdir
# Recipe:: create
#
# Author:: Philip Champon <philip@adaptly.com>

envdir node[:envdir][:directory] do
  action :create
  environment node[:envdir][:environment]
end
