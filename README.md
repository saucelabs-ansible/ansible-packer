[![Build Status](https://travis-ci.org/ldx/ansible-packer.svg?branch=master)](https://travis-ci.org/ldx/ansible-packer)

# packer

Ansible role for installing [Packer](http://packer.io).

## Role variables

- 'packer_version': The version of Packer to install, such as `0.7.1`.

- `packer_download_url`: The URL to download the Packer install from. Derives from `packer_version`.

- `packer_archive_path`: Where the Packer archive will be downloaded to. Derives from `packer_version`.

- `packer_binary_path`: Where Packer binaries will be extracted to.

- `packer_plugins`: A dictionary of plugins to be installed. Example:

    packer_plugins:
      packer-builder-lxc:
        name: lxc
        type: builder
        url: https://s3.amazonaws.com/my-s3-bucket/packer-builder-lxc

  Where
  - `name`: the name of the plugin that can be used in a packer template.
  - `type`: either `builder` or `provisioner`.
  - `url`: URL to fetch the binary from.

  A packer configuration file at `/etc/packer.conf` will automatically created that contains any builder or provisioner installed via `packer_plugins`.

- `packer_plugins_force_install`: Whether to force the installation of plugins, even if they exist. Useful for forcing an update. Example: `false`.

## Example playbook

    ---
    - hosts: all
      sudo: True
      roles:
        - role: packer
          packer_version: 0.7.1
