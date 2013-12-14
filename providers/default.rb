#
# Cookbook Name:: envdir
# Provider:: default
#

def action_create
  Chef::Log.info "Creating #@new_resource" unless exists?
  init_resource
  remove_orphaned_files
  create_files
end

def action_delete
  Chef::Log.info "Deleting #@new_resource" if exists?
  directory new_resource.directory do
    recursive true
    action :delete
  end
end


def init_resource
  package(new_resource.daemontools_package)

  directory new_resource.directory do
    recursive true
    owner new_resource.user
    group new_resource.group
    mode new_resource.directory_mode
    action :create
  end
end

def remove_orphaned_files
  Dir["#{new_resource.directory}/*"].each do |file|
    file_name = ::File.basename(file)
    unless new_resource.environment[file_name]
      Chef::Log.info "Removing #{file}"
      file file do
        action :delete
      end
    end
  end
end

def file_path(key)
  "#{new_resource.directory}/#{key}"
end

# If you want to unset an env var, make the file 0 bytes
# You can not append to a variable, only set or unset
# http://cr.yp.to/daemontools/envdir.html
def create_files
  new_resource.environment.each do |key,value|
    Chef::Log.debug "Creating #{key} #{value}"
    file file_path(key) do
      owner new_resource.user
      group new_resource.group
      action :create
      mode new_resource.file_mode
      content value.to_s
    end
  end
end

private 
def exists?
  ::Dir.exists?(new_resource.directory)
end
