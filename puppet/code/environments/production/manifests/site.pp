node 'db-c.foo.org.nz' {
	package { 'vim': ensure => present }
	include sudo
	include ntp_service
	include mariadb
	include users
}
node 'app-c.foo.org.nz' {
	package { 'vim': ensure => present }
	include sudo
	include ntp_service
	include users
}

node 'backups-c.foo.org.nz' {
	package { 'vim': ensure => present }
	include sudo
	include ntp_service
	include users
}

node 'mgmt-c.foo.org.nz' {
	include nagios
}
