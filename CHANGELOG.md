# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.2.1] - 2019-09-05

### Fixed

- Ensure freeradius users and client fragments are separated with
  newline if the fragments do not end with one.

## [0.2.0] - 2019-08-30

### Added

- Manage clients with define `freeradius::client`

### Changed

- Manage users with define `freeradius::user`

## [0.1.0] - 2019-06-04

Initial release. Several important parts still missing.

### Added

- Management of freeradius package, service and the authorize
  configuration.
