# packer

[![License](https://img.shields.io/badge/license-MIT-blue.svg?style=flat)](https://raw.githubusercontent.com/saucelabs-ansible/packer/master/LICENSE)
[![Build Status](https://travis-ci.org/saucelabs-ansible/packer.svg?branch=master)](https://travis-ci.org/saucelabs-ansible/packer)

Ansible role for installing [Packer](http://packer.io).

## Role variables

- 'packer_version': The version of Packer to install, such as `0.7.1`.

- `packer_download_url`: The URL to download the Packer install from. Derives from `packer_version`.

- `packer_archive_path`: Where the Packer archive will be downloaded to. Derives from `packer_version`.

- `packer_binary_path`: Where Packer binaries will be extracted to.

- `packer_force_install`: Whether to force the installation of Packer and its plugins if they already exist. Useful for forcing an update.

- `packer_plugins`: A dictionary of plugins to be installed. Example:

```
packer_plugins:
  packer-builder-lxc:
    name: lxc
    type: builder
    url: https://s3.amazonaws.com/my-s3-bucket/packer-builder-lxc
```

  Where
  - `name`: the name of the plugin that can be used in a packer template.
  - `type`: either `builder` or `provisioner`.
  - `url`: URL to fetch the binary from.

  A packer configuration file at `/etc/packer.conf` will automatically created that contains any builder or provisioner installed via `packer_plugins`.

## Example playbook

    ---
    - hosts: all
      sudo: True
      roles:
        - role: packer
          packer_version: 0.7.1
          force_install: True

## Testing

Testing requires Ruby, Vagrant and VirtualBox or Docker to be installed.

Use of RVM (or similar) to maintain dedicated gemsets is highly recommended.

First, install Vagrant and VirtualBox.

Next install Ruby:

    rvm install ruby-2.2

Next, (optional), create a gemset for testing this role:

    rvm use 2.2@saucelabs-ansible_packer --create
    bundle install

A simpler alternative is to install the dependencies in a vendor directory

    rvm use 2.2
    bundler install --path vendor/bundle

Finally, test the role with `kitchen test`.

It should spin up an Ubuntu VM, run the role, and run the test suite against the role.

```
KITCHEN_DRIVER=docker KITCHEN_PROVIDER=docker KITCHEN_PLATFORM=ubuntu-14.04 bundle exec kitchen test
KITCHEN_DRIVER=vagrant KITCHEN_PROVIDER=virtualbox KITCHEN_PLATFORM=ubuntu/trusty64 bundle exec kitchen test
```
