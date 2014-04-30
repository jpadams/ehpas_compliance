require 'facter'

Facter.add(:uid0) do
  setcode do
    Facter::Util::Resolution.exec("/usr/local/sbin/uid0.sh")
  end
end