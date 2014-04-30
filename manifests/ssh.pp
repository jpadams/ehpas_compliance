# class compliance::ssh
# remote root login via ssh must be disabled

class compliance::ssh {
  if $operatingsystem != "Windows" {
    augeas { "sshd_config":
      context => "/files/etc/ssh/sshd_config",
      lens    => "sshd.lns",
      incl    => "/etc/ssh/sshd_config",
      changes => ["set PermitRootLogin no",],
    }
  }

}
