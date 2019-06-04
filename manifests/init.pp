# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include freeradius
class freeradius (
  Array[String] $packages,
  String $service,
) {

  class { 'freeradius::install':
    packages => $packages,
  }

  class { 'freeradius::config':
    require => Class['freeradius::install'],
    notify  => Class['freeradius::service']
  }

  class { 'freeradius::service':
    service => $service,
  }
}
