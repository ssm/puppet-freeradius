# @summary Manage freeradius users
#
# Manage freeradius users. This creates a fragment added to the
# authorize file.
#
# @param order
#   Optional parameter for concat::fragment.
#
# @param content
#   Text content for the user definition. See
#   https://freeradius.org/radiusd/man/users.txt for format
#   documentation.
#
# @example
#   freeradius::user { 'bob':
#     content => "\"bob\" Cleartext-Password == \"changeme\"\n"
#   }
#   freeradius::user { 'DEFAULT':
#     order   => 01,
#     content => "\"bob\" Cleartext-Password == \"changeme\"\n",
#   }
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
