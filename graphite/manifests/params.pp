class graphite::params {

  case $::operatingsystem {

    "centos": {
      case $::operatingsystemrelease {
        /^7\.\d+/: {
          $packages = [
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
            
          $pip_packages = [
            "https://github.com/graphite-project/ceres/tarball/master",
            "django<1.6",
            "Twisted<12",
            "django-tagging==0.3.6",
            "whisper",
            "graphite-web",
            "carbon", ]
        }

        default: {
          fail("Unsupported RedHat release: ${::operatingsystemrelease}")
        }
      }
    }

    default: {
      fail("Module ${module_name} is not supported on ${::operatingsystem}")
      }
    }

  }
