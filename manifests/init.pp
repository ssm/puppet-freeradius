# @summary Manage FreeRADIUS
#
# This module manages the FreeRADIUS package, service, and a tiny bit
# of configuration.
#
# @example
#   include freeradius
#
# @param users
#   A hash of concat::fragment resources used for building the
#   conf-module/files/authorize file containing users. The "target" is
#   set, you should provide "content" or "source", as well as "order".
# @param packages
#   The list of packages to install. Defaults from module data to
#   match OS family.
# @param service
#   The service to manage. Defaults from module data to match OS
#   family.
# @param config_owner
#   The user owning the configuration file. Defaults from module data
#   to match OS family.
# @param config_group
#   The group owning the configuration file. Defaults from module data
#   to match OS family.
# @param config_mode
#   The permissions on the configuration files. Defaults from module
#   data to match OS family.
# @param config_dir
#   The root of the configuration directory. Defaults from module
#   data to match OS family.
#
class freeradius (
  Array[String] $packages,
  String $service,
  Stdlib::Absolutepath $config_dir,
  String $config_owner,
  String $config_group,
  String $config_mode,
  Hash $users = {},
) {

  class { 'freeradius::install':
    packages => $packages,
  }

  class { 'freeradius::config':
    users        => $users,
    config_dir   => $config_dir,
    config_owner => $config_owner,
    config_group => $config_group,
    config_mode  => $config_mode,
    require      => Class['freeradius::install'],
    notify       => Class['freeradius::service']
  }

  class { 'freeradius::service':
    service => $service,
  }
}
