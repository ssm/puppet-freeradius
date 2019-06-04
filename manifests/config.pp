# @summary Manage FreeRADIUS configuration.
#
# This class manages the FreeRADIUS configuration.
#
# For now, a concat resource for the users file is managed.
#
# @param users
#  A hash of concat::fragment resources which will be added to the
#  user file. The 'target' is set automatically
#
# @example
#   include freeradius::config
# @api private
class freeradius::config (
  Stdlib::Absolutepath $config_dir,
  String $config_owner,
  String $config_group,
  String $config_mode,
  Hash $users,
) {

  # Parameter
  $users_file = "${config_dir}/users"

  # Manage users
  concat { $users_file:
    owner => $config_owner,
    group => $config_group,
    mode  => $config_mode,
  }
  $users.each |$user, $user_params| {
    $params = $user_params + { 'target' => $users_file }
    concat::fragment { $user:
      * => $params,
    }
  }
}
