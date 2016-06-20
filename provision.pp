$packages = [
   "nano",
]
package { $packages:
   ensure => installed,
}
file { "/vagrant/simp-core/src/doc":
   ensure => 'link',
   target => '/vagrant/simp-doc'
}
class { "::rvm": }

rvm_system_ruby {
  'ruby-1.9':
    ensure      => 'present',
    default_use => true,
  'ruby-2.0':
    ensure      => 'present',
    default_use => false;
  'ruby-2.2.5':
    ensure      => 'present',
    default_use => false;

}
