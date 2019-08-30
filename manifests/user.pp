# @summary A short summary of the purpose of this defined type.
#
# A description of what this defined type does
#
# @example
#   freeradius::user { 'namevar': }
define freeradius::user (
  String $content,
  Optional[Variant[String,Integer]] $order = undef,
  String $user = $title,
) {

  $config_dir = lookup('freeradius::config_dir')
  $target = "${config_dir}/mods-config/files/authorize"

  concat::fragment { $user:
    target  => $target,
    order   => $order,
    content => $content,
  }

}
