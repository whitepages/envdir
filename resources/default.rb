#
# Cookbook Name:: envdir
# Resource:: default
#

actions :create, :delete
default_action :create

attribute :directory, :kind_of => String, :name_attribute => true, :required => true
attribute :environment, :kind_of => Hash, :default => Hash.new

attribute :daemontools_package, :kind_of => String, :default => "daemontools"
attribute :directory_mode, :kind_of => String, :default => "0555"
attribute :file_mode, :kind_of => String, :default => "0444"
attribute :group, :kind_of => String, :default => "root"
attribute :user, :kind_of => String, :default => "root"
