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
