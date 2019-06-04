# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include freeradius::install
# @api private
class freeradius::install (Array[String] $packages) {

  package { $packages:
    ensure => present
  }

}
