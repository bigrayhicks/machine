# Consul

This Ansible role performs a basic [Consul](https://consul.io/) installation,
including filesystem structure, example configuration, and Consul UI
installation.

It does not yet handle full configuration and initialization of
a functioning Consul cluster, but that is on the road map for a future
version.

## Requirements

This role requires a Debian or RHEL family of Linux host; the role is tested 
with the following specific software versions:

* Ansible: 1.9.2
* Consul: 0.5.2
* Debian: 8

## Role Variables

The role specifies variables in `defaults/main.yml` and `vars/*.yml`.

| Name           | Default Value | Description                        |
| -------------- | ------------- | -----------------------------------|
| `consul_version` | `0.5.2` | Consul version to install |
| `consul_zip_url` | `https://dl.bintray.com/mitchellh/consul/{{ consul_version }}_linux_amd64.zip` | Consul download URL |
| `consul_zip_sha256` | SHA256 SUM | Consul download SHA256 summary |
| `consul_bin_path` | `/usr/local/bin` | Consul binary installation path |
| `consul_config_path` | `/etc/consul.d` | Consul configuration file path |
| `consul_data_path` | `/var/consul` | Consul data path |
| `consul_log_path` | `/var/log/consul` | Consul log path |
| `consul_user` | `consul` | Consul OS user |
| `consul_group` | `bin` | Consul OS group |
| `consul_datacenter` | boone | Consul datacenter label |
| `consul_domain` | `local` | Consul domain name |
| `consul_log_level` | `INFO` | Consul logging level |
| `consul_syslog_enable` | true | Consul logs to syslog |
| `consul_ui_url` | `https://dl.bintray.com/mitchellh/consul/0.5.2_web_ui.zip` | Consul UI download URL | 
| `consul_ui_pkg` | `0.5.2_web_ui.zip` | Conul UI package file name |
| `consul_ui_sha256` | SHA256 SUM | Consul UI download SHA256 summary |
| `consul_iface` | `eth1` | Consul network interface |

### OS Distribution Variables

The Consul binary works on most Linux platforms and is not distribution
specific. Some distributions require installation of specific OS packages with different nomenclature, so this role was built with support for
the major Linux distributions.

| Name           | Default Value | Description                        |
| -------------- | ------------- | -----------------------------------|
| `consul_centos_pkg` | `{{ consul_version }}_linux_amd64.zip` | Consul package filename |
| `consul_centos_url` | `{{ consul_zip_url }}` | Consul package download URL |
| `consul_centos_sha256` | SHA256 SUM | Consul download SHA256 summary |
| `consul_centos_os_packages` | list | List of OS packages to install |
| `consul_debian_pkg` | `{{ consul_version }}_linux_amd64.zip` | Consul package filename |
| `consul_debian_url` | `{{ consul_zip_url }}` | Consul package download URL |
| `consul_debian_sha256` | SHA256 SUM | Consul download SHA256 summary |
| `consul_debian_os_packages` | list | List of OS packages to install |
| `consul_redhat_pkg` | `{{ consul_version }}_linux_amd64.zip` | Consul package filename |
| `consul_redhat_url` | `{{ consul_zip_url }}` | Consul package download URL |
| `consul_redhat_sha256` | SHA256 SUM | Consul download SHA256 summary |
| `consul_redhat_os_packages` | list | List of OS packages to install |
| `consul_ubuntu_pkg` | `{{ consul_version }}_linux_amd64.zip` | Consul package filename |
| `consul_ubuntu_url` | `{{ consul_zip_url }}` | Consul package download URL |
| `consul_ubuntu_sha256` | SHA256 SUM | Consul download SHA256 summary |
| `consul_ubuntu_os_packages` | list | List of OS packages to install |

## Dependencies

None

## Example Playbook


After you have reviewed and altered any necessary variables, and created a
hosts inventory, basic Consul installation is possible using the 
included `site.yml` playbook:

```
ansible-playbook -i hosts site.yml
```

You can also simply pass variables in using the `--extra-vars` option
to the `ansible-playbook` command:

```
ansible-playbook -i hosts site.yml --extra-vars "consul_datacenter=maui"
```

### Vagrant and VirtualBox

See `examples/README_VAGRANT.md` for details on quick Vagrant deployments
under VirtualBox for testing, etc.

## License

BSD

## Author Information

[Brian Shumate](http://brianshumate.com)
