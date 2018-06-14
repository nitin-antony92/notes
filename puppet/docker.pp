$packages=["yum-utils","device-mapper-persistent-data","lvm2"]
package{$packages:
ensure =>"installed",
}
exec { 'yum-config-manager --add-repo https:/download.docker.com/linux/centos/docker-ce.repo':
path => '/bin: /usr/bin',    
command => "yum-config-manager --add-repo https:/download.docker.com/linux/centos/docker-ce.repo",
  }
exec { 'yum -y update':
path => '/bin: /usr/bin', 
  }
package{"docker-ce":
ensure =>"installed"
}
service{'docker':
ensure => "running",
enable => "true"
}