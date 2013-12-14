# envdir cookbook

The envdir cookbook is a LWRP for creating, deleting, and maintaining
directories to be used with daemontools [envdir](http://cr.yp.to/daemontools/envdir.html)
command. The cookbook will attempt to install the daemontools package, create
your envdir directory, and add and delete files, based on a hash you define, 
from the directory as needed.

# Requirements

The [daemontools](http://cr.yp.to/daemontools.html) system package.

# Usage

You can use the LWRP directly, or you can use the create and delete recipes.
When using the built in recipes, you'll need to set attributes for
`node[:envdir][:directory]` and `node[:envdir][:environment]`.

## create recipe

```
run_list("recipe[envdir::create]")
default_attributes(
  :envdir => {
    :directory => "/etc/rails_app.d/env",
    :environment => {
      :HOME => "/home/appuser"
      :PATH => "/home/appuser/.rbenv/shims:/home/appuser/.rbenv/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
    }
  }
)
```

## LWRP

```
envdir "/etc/rails_app.d/env" do
  environment(
    :HOME => "/home/appuser"
    :PATH => "/home/appuser/.rbenv/shims:/home/appuser/.rbenv/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
  )
end
```

# Attributes

* *directory* The directory where you'll store your environment configuration
* *environment* A hash of key value pairs, defining environment variables and
  their values
* *daemontools_package* The name of the daemontools system package (default:
  daemontools)
* *directory_mode* The mode of *directory* created (default: 0555)
* *file_mode* The mode of files created (default: 0444)
* *group* The group owner of the directory and files created (default: root)
* *user* The owner of the directory and files created (default: root)

# Recipes

## create

As long as you create default values for the envidr directory and environment,
you can include this where ever you like.

## delete

Ensure that you define `node[:envidr][:directory]` and you can include this.

# Author

Author:: Philip Champon (<philip@adaptly.com>)
