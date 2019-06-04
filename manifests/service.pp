# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include freeradius::service
class freeradius::service (String $service) {
  service { $service:
    ensure => running,
    enable => true,
  }
}
