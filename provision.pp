$packages = [
   "git",
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
  'ruby-1.9.3':
    ensure      => 'present',
    default_use => true;
  'ruby-2.0.0':
    ensure      => 'present',
    default_use => false;
  'ruby-2.2.5':
    ensure      => 'present',
    default_use => false;

}
rvm_gem {
  'ruby-2.0.0/bundler':
    ensure  => latest;
  'ruby-1.9.3/bundler':
    ensure  => latest;
  'ruby-2.2.5/bundler':
    ensure  => latest;
}
file_line { "changegemfile":
  path => "/vagrant/simp-doc/Gemfile",
  match => "gem 'puppet-strings', :git => 'https://github.com/puppetlabs/puppetlabs-strings.git'",
  line => "gem 'puppet-strings', :git => '/vagrant/modules/strings'",
}