# Class: vmtools
#
# Installs the Vm tools, depending on type of virtualization
class vmtools {
  case $::virtual {
    default   : {}
    'ovirt'   : { include vmtools::ovirt }
    /^xen*/   : { include vmtools::xen }
    /^vmware$/: { include openvmtools }
  }
}
