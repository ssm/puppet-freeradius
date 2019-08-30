# @summary A short summary of the purpose of this defined type.
#
# A description of what this defined type does
#
# @example
#   freeradius::client { 'namevar': }
define freeradius::client (
  String $client = $title,
  Hash[String, String] $attributes = {},
) {

  $config_dir = lookup('freeradius::config_dir')
  $target = "${config_dir}/clients.conf"

  $client_template = @(CLIENT)
  <% | String $client, Hash[String, String] $attributes | -%>
  client <%= $client %> {
    <%- $attributes.each |$key, $value| { -%>
      <%= $key %> = <%= $value %>
    <%- } -%>
  }
  | CLIENT

  concat::fragment { $client:
    target  => $target,
    content => inline_epp($client_template, {'client' => $client, 'attributes' => $attributes})
  }

}
