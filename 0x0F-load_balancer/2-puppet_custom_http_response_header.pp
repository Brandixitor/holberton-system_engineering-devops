# Script that setup a nginx web server on our server + redirection + header
exec { 'update':
  command => '/usr/bin/apt update'
}

package { 'nginx':
  ensure  => installed,
  require => Exec['update']
}

# Index page
file { '/var/www/html/index.html':
  ensure  => present,
  path    => '/var/www/html/index.html',
  content => 'Holberton School',
  require => Package['nginx']
}

# Redirect to fabulous Rick Astley page
file_line { 'Rick Astley showtime':
  ensure  => 'present',
  path    => '/etc/nginx/sites-available/default',
  after   => 'listen 80 default_server;',
  line    => '        rewrite ^/redirect_me https://www.youtube.com/watch?v=dQw4w9WgXcQ permanent;',
  require => Package['nginx']
}

# Redirect to fabulous Rick Astley page
file_line { 'X-Server-By header addition':
  ensure  => 'present',
  path    => '/etc/nginx/sites-available/default',
  after   => 'listen 80 default_server;',
  line    => '        add_header X-Server-By $hostname;',
  require => Package['nginx']
}

service { 'nginx':
  ensure  => running,
  require => Package['nginx']
}
