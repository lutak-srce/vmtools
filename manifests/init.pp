# Class: vmtools
#
# Installs the Vm tools, depending on type of virtualization
class vmtools {
  case $::virtual {
    default:    {}
    'ovirt':    { include ::vmtools::ovirt }
    /^xen*/:    { include ::vmtools::xen }
    /^vmware$/: { 
      exec { 'vmware-uninstall-tools':
        command => '/usr/bin/vmware-uninstall-tools.pl && rm -rf /usr/lib/vmware-tools',
        path    => '/bin:/sbin:/usr/bin:/usr/sbin',
        onlyif  => 'test -f /usr/bin/vmware-uninstall-tools.pl',
      }

      class{ 'openvmtools':
        require => Exec['vmware-uninstall-tools'],
      }
    }
  }
}
