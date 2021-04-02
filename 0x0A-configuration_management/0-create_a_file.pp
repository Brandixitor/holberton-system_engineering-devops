# A script that creates a bew file called Holberton in tmp directory.
  file { '/tmp/holberton':
    ensure  => 'present',
    content => 'I love Puppet',
    owner   => 'www-data',
    group   => 'www-data',
    mode    => '0744',
  }
