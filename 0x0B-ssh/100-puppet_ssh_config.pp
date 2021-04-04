# Configuring ssh to use custom private keys.

file_line { 'Turn off passwd auth':
  ensure   => 'present',
  name     => 'AUTH_PWD',
  path     => '/etc/ssh/ssh_config',
  line     => 'PasswordAuthentication no',
}
file_line { 'Declare identity file':
  ensure   => 'present',
  name     => 'IDENTITY_FILE',
  path     => '/etc/ssh/ssh_config',
  line     => 'IdentityFile ~/.ssh/holberton',
}
FILE_LINE['AUTH_PWD'] ~> FILE_LINE['IDENTITY_FILE']
