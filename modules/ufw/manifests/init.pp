include ufw 

ufw::allow { 'ssh':
	port => 22,
}
ufw::allow { 'puppet':
	port => 8140,
}

ufw::allow { 'NTP service':
	port => 123,
}
 
