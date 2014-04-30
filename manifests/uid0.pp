# Class compliance::uid0
#
# Ensure no UID 0 account exist other than root.
#
# This is a reported, not enforced, control item.
#

class compliance::uid0 {
  if $operatingsystem == "SLES" and $operatingsystemrelease >= 11 {
    file { '/usr/local/sbin/uid0.sh':
      source => 'puppet:///modules/compliance/uid0.sh',
      owner  => root,
      group  => root,
      mode   => '0700',
    }

    if $uid0 == 'fail' {
      warning('Node $fqdn failed uid0 requirement')
    }

  }
}