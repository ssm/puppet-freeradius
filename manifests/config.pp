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
#   include freeradius
# @api private
class freeradius::config (
  Stdlib::Absolutepath $config_dir,
  String $config_owner,
  String $config_group,
  String $config_mode,
  Hash $users,
  Hash $clients,
) {

  # Parameter

  $clients_file = "${config_dir}/clients.conf"
  $users_file   = "${config_dir}/mods-config/files/authorize"

  # Manage users
  concat { $users_file:
    owner          => $config_owner,
    group          => $config_group,
    mode           => $config_mode,
    ensure_newline => true,
  }
  $users.each |$user, $params| {
    freeradius::user { $user:
      * => $params,
    }
  }

  # Manage clients
  concat { $clients_file:
    owner          => $config_owner,
    group          => $config_group,
    mode           => $config_mode,
    ensure_newline => true,
  }
  $clients.each | $client, $params| {
    freeradius::client { $client:
      * => $params,
    }
  }
}
