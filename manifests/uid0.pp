# Class ehpas_compliance::uid0
#
# Ensure no UID 0 account exist other than root.
#
# This is a reported, not enforced, control item.
#

class ehpas_compliance::uid0 {
  #if $operatingsystem == "SLES" and $operatingsystemrelease >= 11 {
    file { ['/etc/puppetlabs/facter','/etc/puppetlabs/facter/facts.d']:
      ensure => directory,
      owner  => root,
      group  => root,
     } ->

    file { '/etc/puppetlabs/facter/facts.d/uid0.sh':
      source  => 'puppet:///modules/compliance/uid0.sh',
      owner   => root,
      group   => root,
      mode    => '0700',
    }

    if $::uid0 == 'fail' {
      # Using parsejson function from puppetlabs/stdlib
      $values = parsejson($::uid0_failures)
    } else {
      $values = []
    }
    #notify { "Node ${::fqdn} failed uid0 requirement due to existence of ${::uid0_failures} user(s).": }
    $code = upcase($::uid0)
    $check = 'UID0'
    $item = ''
    $type = ''

    $result = split(template('ehpas_compliance/ehpas.erb'), ",")
    notify { $result:
      tag => ['ehpas'],
    }

  #}
}
