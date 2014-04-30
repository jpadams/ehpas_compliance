
class compliance::cron {
  if $operatingsystem == "SLES" and $operatingsystemrelease >= 11 {
    # Run a job on first of the month at midnight
    cron { 'my_puppet_job':
      ensure   => 'present',
      command  => '/usr/local/my_puppet_job',
      user     => 'root',
      monthday => 1,
      hour     => 0,
      minute   => 0
    }

  }

  if $operatingsystem == "windows" {
    # Run a job on first of the month at midnight
    scheduled_task { 'my_puppet_job':
      ensure    => present,
      enabled   => true,
      command   => 'C:\path\to\command.exe',
      arguments => '/flags /to /pass',
      user      => 'SYSTEM',
      trigger   => {
        schedule   => monthly,
        start_time => '00:00',
        on         => [1],
      }
    }

  }

}