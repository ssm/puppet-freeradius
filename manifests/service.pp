# @summary Manage the FreeRADIUS service
#
# This class manages the FreeRADIUS service.
#
# @example
#   include freeradius
# @api private
class freeradius::service (String $service) {
  service { $service:
    ensure => running,
    enable => true,
  }
}
