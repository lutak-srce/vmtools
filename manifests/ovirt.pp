#
# = Class: vmtools::ovirt
#
# Installs the Tools for Open Virtualization
#
class vmtools::ovirt {
  case $::osfamily {
    /(RedHat|redhat)/: {

      package { 'ovirt-guest-agent-common': }

      service { 'ovirt-guest-agent':
        ensure => running,
        enable => true,
        equire => Package['ovirt-guest-agent-common'],
      }

    }
    default: {
      fail("Unsupported osfamily: ${::osfamily} operatingsystem: ${::operatingsystem}, module ${module_name} currently only supports osfamily RedHat and Debian")
    }
  }
}
