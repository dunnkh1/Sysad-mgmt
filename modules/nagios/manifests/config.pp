class nagios::config {
	file { "/etc/nagios3/conf.d":
		ensure => present,
		group => "puppet",
		mode => "0775",
	}

	
        nagios_hostgroup {"my-ssh-servers":
                target => "/etc/nagios3/conf.d/ppt_hostgroups.cfg",
                mode => "0444",
                alias => "My SSH servers",
                members => "db-c.foo.org.nz, app-c.foo.org.nz, mgmt-c.foo.org.nz, backups-c.foo.org.nz,"
        }

	
        nagios_hostgroup {"my-http-servers":
                target => "/etc/nagios3/conf.d/ppt_hostgroups.cfg",
                mode => "0444",
                alias => "My HTTP servers",
                members => "app-c.foo.org.nz,"
        }


	nagios_hostgroup {"my-mariadb-servers":
                target => "/etc/nagios3/conf.d/ppt_hostgroups.cfg",
                mode => "0444",
                alias => "My Mariadb servers",
                members => "db-c.foo.org.nz,"
        }

	nagios_hostgroup{"remote-disks":
		target => "/etc/nagios3/conf.d/ppt_hostgroups.cfg",
		mode => "0444",
		alias => "Remote Disks",
		members => "db-c.foo.org.nz, backups-c.foo.org.nz, app-c.foo.org.nz,"
	}

	nagios_contactgroup {'slackgroup':
		target => '/etc/nagios3/conf.d/ppt_contactgroups.cfg',
		mode => '0444',
		alias => 'Slack channel',
		members => 'slack',
	}

	nagios_host { "db-c.foo.org.nz":
		target => "/etc/nagios3/conf.d/ppt_hosts.cfg",
		alias => "db",
		check_period => "24x7",
		max_check_attempts => 3,
		check_command => "check-host-alive",
		notification_interval => 30,
		notification_period => "24x7",
		notification_options => "d,u,r",
		mode => "0444",
		}
	nagios_host{"app-c.foo.org.nz":
                target => "/etc/nagios3/conf.d/ppt_hosts.cfg",
                alias => "app",
                check_period => "24x7",
                max_check_attempts => 3,
                check_command => "check-host-alive",
                notification_interval => 30,
                notification_period => "24x7",
                notification_options => "d,u,r",
                mode => "0444",
	}
	nagios_host{"backups-c.foo.org.nz":
                target => "/etc/nagios3/conf.d/ppt_hosts.cfg",
                alias => "backups",
                check_period => "24x7",
                max_check_attempts => 3,
                check_command => "check-host-alive",
                notification_interval => 30,
                notification_period => "24x7",
                notification_options => "d,u,r",
                mode => "0444",
	}
	nagios_host {"mgmt-c.foo.org.nz":
                target => "/etc/nagios3/conf.d/ppt_hosts.cfg",
                alias => "mgmt",
                check_period => "24x7",
                max_check_attempts => 3,
                check_command => "check-host-alive",
                notification_interval => 30,
                notification_period => "24x7",
                notification_options => "d,u,r",
                mode => "0444"
	}
	nagios_service {"ssh":
		service_description => "ssh servers",
		hostgroup_name => "my-ssh-servers",
		target => "/etc/nagios3/conf.d/ppt_services.cfg",
		check_command => "check_ssh",
		max_check_attempts => 3,
		retry_check_interval => 1,
		normal_check_interval => 5,
		check_period => "24x7",
		notification_interval => 30,
		notification_period => "24x7",
		notification_options => "w,u,c",
		contact_groups => "admins",
	}

	nagios_service {"mariadb":
                service_description => "mariadb servers",
                hostgroup_name => "my-mariadb-servers",
                target => "/etc/nagios3/conf.d/ppt_services.cfg",
                check_command => "check_mysql_cmdlinecred!nagios!mypasswd",
                max_check_attempts => 3,
                retry_check_interval => 1,
                normal_check_interval => 5,
                check_period => "24x7",
                notification_interval => 30,
                notification_period => "24x7",
                notification_options => "w,u,c",
                contact_groups => "admins",
        }

        nagios_service {"remote-disk-check":
                service_description => "Check disk space on remote servers",
                hostgroup_name => "remote-disks",
                target => "/etc/nagios3/conf.d/ppt_services.cfg",
                check_command => "check_nrpe!check_hd",
                max_check_attempts => 3,
                retry_check_interval => 1,
                check_period => "24x7",
                normal_check_interval => 5,
                notification_interval => 2,
                notification_period => "24x7",
                notification_options => "w,u,c",
                contact_groups => "slackgroup",
                mode => '0444',
        }


	nagios_contact {'slack':
		target => '/etc/nagios3/conf.d/ppt_contacts.cfg',
		alias => 'Slack',
		service_notification_period => '24x7',
		host_notification_period => '24x7',
		service_notification_options => 'w,u,c,r',
		host_notification_options => 'd,r',
		service_notification_commands => 'notify-service-by-slack',
		host_notification_commands => 'notify-host-by-slack',
		email => 'root@localhost',
	}

	
        nagios_service {"http":
                service_description => "http servers",
                hostgroup_name => "my-http-servers",
                target => "/etc/nagios3/conf.d/ppt_services.cfg",
                check_command => "check_http!10.25.137.201",
                max_check_attempts => 2,
                retry_check_interval => 1,
                normal_check_interval => 5,
                check_period => "24x7",
                notification_interval => 1,
                notification_period => "24x7",
                notification_options => "w,u,c",
                contact_groups => "slackgroup",
		mode => '0444',
        }


	
		

}
