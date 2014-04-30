
class compliance::files {
  if $operatingsystem == "SLES" and $operatingsystemrelease >= 11 {
    file { '/etc/passwd':
      owner => 'root',
      group => 'root',
      mode  => '0644',
    }

    file { '/etc/shadow':
      owner => 'root',
      group => 'shadow',
      mode  => '0400',
    }

    file { '/etc/ssh/sshd_config':
      owner => 'root',
      group => 'root',
      mode  => '0640',
    }

  }

  if $operatingsystem == "Solaris" and $operatingsystemrelease >= 10 {
    file { '/etc/passwd':
      owner => 'root',
      group => 'sys',
      mode  => '0644',
    }

    file { '/etc/shadow':
      owner => 'root',
      group => 'sys',
      mode  => '0400',
    }

    file { '/etc/ssh/sshd_config':
      owner => 'root',
      group => 'sys',
      mode  => '0644',
    }
  }

}