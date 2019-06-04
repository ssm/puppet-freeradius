# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include freeradius
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
