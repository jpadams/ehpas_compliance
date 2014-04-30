# class security::banner
# Copy several base files to each node - current
# - /etc/issue

class compliance::banner {
  if $operatingsystem == "SLES" and $operatingsystemrelease >= 11 {
    file { '/etc/issue':
      ensure  => 'present',
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      content => template('compliance/issue.erb')
    }

    file { '/etc/issue.net':
      ensure  => 'present',
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      content => template('compliance/issue.erb')
    }
  }

  if $operatingsystem == "Solaris" and $operatingsystemrelease >= 10 {
    file { '/etc/issue':
      ensure  => 'present',
      owner   => 'root',
      group   => 'root',
      mode    => '0444',
      content => template('compliance/issue.erb')
    }
  }

  if $operatingsystem == "windows" {
    registry_value { 'HKLM\Software\Microsoft\Windows NT\CurrentVersion\winlogon\LegalNoticeCaption':
      ensure => present,
      type   => string,
      data   => "Warning",
    }

    registry_value { 'HKLM\Software\Microsoft\Windows NT\CurrentVersion\winlogon\LegalNoticeText':
      ensure => present,
      type   => string,
      data   => "This is a private computer system -- Usage may be monitored and unauthorized access or use may result in criminal or civil prosecution. Except for some privacy rights granted by applicable law, by signing on to the system you acknowledge: You do not have any expectation of privacy in your use of the system. You are familiar with, understand, accept, and will comply with the provisions of Company Directive B-109.",
    }
  }

}