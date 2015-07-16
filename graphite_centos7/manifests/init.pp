# == Class: graphite_centos7
#
# Full description of class graphite_centos7 here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the function of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { 'graphite_centos7':
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2015 Your name here, unless otherwise noted.
#
class graphite_centos7 {

	$packages = [
	"epel-release",
	"python-pip",
	"httpd",
	"net-snmp",
	"perl",
	"pycairo",
	"mod_wsgi",
	"python-devel",
	"git",
	"gcc-c++",
	"npm", ]
	package { $packages: ensure => "installed", }

	$pip_packages = [
	"https://github.com/graphite-project/ceres/tarball/master",
	"django<1.6",
	"Twisted<12",
	"django-tagging==0.3.6",
	"whisper",
	"graphite-web",
	"carbon", ]
	package { $pip_packages:
			ensure   => "installed",
			provider => "pip",
			require  => Package[$packages],
	}

}
