class users::config{
user	{'nic':
        home => '/home/nic',
        ensure => 'present',
        gid => '1000',
        password => '$6$xyz$ShNnbwk5fmsyVIlzOf8zEg4YdEH2aWRSuY4rJHbzLZRlWcoXbxxoI0hfn0mdXiJCdBJ/lTpKjk.vu5NZOv0UM0',
        shell => '/bin/bash';

	'student':
        home => '/home/student',
        ensure => 'present',
        gid => '1000',
        password => '$6$xys$mCSKxwMGRzG.YRQBzuro3S2JHRHVfdoe2ZFTDOZbTfCuIf198MtNHYMCaHZf3K11rOUONIhieCNPxJW2Y5v6U0',
        shell => '/bin/bash';

	
	
	'kane':
        home => '/home/kane',
        ensure => 'present',
        gid => '1000',
        password => '$6$mysalt$Tv1MP.2T4ZXONaMNNdHnB5zu3Xt97A/b9PJUm3SMYBPlwyEAIUwAGloDbGxMf0mL0DBjqmkKR.v94QciSU0wT1',
        shell => '/bin/bash',
        }

	
}

