# A script that Kills the process KILLMENOW.
exec { 'killmenow':
  command => 'pkill -f killmenow',
  path    => '/usr/bin:/usr/sbin:/bin',
  onlyif  => 'pgrep killmenow'
}
