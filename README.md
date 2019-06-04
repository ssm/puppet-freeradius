
# freeradius

#### Table of Contents

1. [Description](#description)
2. [Setup - The basics of getting started with freeradius](#setup)
    * [What freeradius affects](#what-freeradius-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with freeradius](#beginning-with-freeradius)
3. [Usage - Configuration options and additional functionality](#usage)
4. [Limitations - OS compatibility, etc.](#limitations)
5. [Development - Guide for contributing to the module](#development)

## Description

This is a module to install and manage
[FreeRADIUS](https://wiki.freeradius.org/Home).

## Setup

### What freeradius affects

The module manages:

* Packages needed for installing FreeRADIUS server and utilities.
* The freeradius service.
* The "mods-config/files/authorize" file, for user definitions and
  defaults.

The rest is so far up to you.

### Beginning with freeradius

Include the class, and provide a hash of concat::fragment resources
for the `$users` parameter.

## Usage

The users are provided to the module as a hash of "concat::fragment"
resources. The important bits are the "content" or "source" and
"order" parameters.

The "content" or "source" must contain one (or more) user definitions
for the radius "mods-config/files/authorize" file, on the FreeRADIUS
configuration format.

Order matters in the authorize file. The concat resource will order
the fragments according to its defaults, so you should order them
using the "order" parameter.


```puppet
$users = {
  'bob' => {
    content => '"bob" Cleartext-Password := "hello"'
    order   => '101',
  }
}

class { 'freeradius':
  users => $users,
}
```

## Limitations

This module does not yet manage any other config than the "authorize"
file.

If you would like to manage anything other than the default
configuration of FreeRADIUS, which on Debian and Red Hat covers a
number of scenarios, manage these files explicitly, and notify
`Class['freeradius::service']` on changes.

## Development

This module lives on Github. Issues and pull requests are welcome.
