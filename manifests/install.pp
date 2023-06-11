# @summary Install the FreeRADIUS packages.
#
# This class installs the FreeRADIUS packages.
#
# @example
#   include freeradius
# @api private
class freeradius::install (Array[String] $packages) {
  package { $packages:
    ensure => present,
  }
}
