
class owncloud::preinstall {
  include apt

  apt::key {"owncloud":
    id => "DDA2C105C4B73A6649AD2BBD47AE7F72479BC94B",
    options => "https://download.owncloud.org/download/repositories/10.2/Ubuntu_18.04/Release.key",
  }

  file {"/etc/apt/sources.list.d/owncloud.list":
    ensure => present,
    source => "puppet:///modules/owncloud/owncloud.list",
    mode => "0644",
    owner => "root",
    group => "root",
  }
}
