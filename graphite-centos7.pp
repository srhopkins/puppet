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
package { $packages: ensure   => "installed", }

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
