[![Build Status - Master](https://travis-ci.org/juju4/ansible-fileserver.svg?branch=master)](https://travis-ci.org/juju4/ansible-fileserver)
[![Build Status - Devel](https://travis-ci.org/juju4/ansible-fileserver.svg?branch=devel)](https://travis-ci.org/juju4/ansible-fileserver/branches)
# fileserver ansible role

A simple ansible role to setup a file server either through nfs, either through samba

## Requirements & Dependencies

### Ansible
It was tested on the following versions:
 * 1.9
 * 2.0
 * 2.3

### Operating systems

Tested with vagrant on Ubuntu 14.04, Kitchen test with trusty, xenial and centos7

## Example Playbook

Just include this role in your list.
For example

```
- host: all
  roles:
    - juju4.fileserver
```

## Variables

Nothing specific for now.

## Continuous integration

This role has a travis basic test (for github), more advanced with kitchen and also a Vagrantfile (test/vagrant).

Once you ensured all necessary roles are present, You can test with:
```
$ cd /path/to/roles/juju4.fileserver
$ kitchen verify
$ kitchen login
$ KITCHEN_YAML=".kitchen.vagrant.yml" kitchen verify
```
or
```
$ cd /path/to/roles/juju4.fileserver/test/vagrant
$ vagrant up
$ vagrant ssh
```

## Troubleshooting & Known issues

* nfsd not working inside lxc: some restrictions applies if run inside a container
nfsd need unconfined profile, extra capability or review apparmor config
https://forum.proxmox.com/threads/is-it-possible-to-run-a-nfs-server-within-a-lxc.24403/
https://github.com/docker/docker/issues/9950
https://bugs.launchpad.net/ubuntu/+source/lxc/+bug/1575757
https://tquerci.blogspot.fr/2014/03/nfs-on-lxc-container.html
https://github.com/lxc/lxd/issues/2005
manual
```
$ lxc config set default-centos-7-1472172303 raw.lxc lxc.aa_profile=unconfined
$ lxc config set default-centos-7-1472172303 security.privileged true
```
= but still not working


## License

BSD 2-clause
