class nginx {

  package { "nginx":
    ensure  => present,
    require => Class["system-update"],
  }

  service { "nginx":
    ensure  => "running",
    require => Package["nginx"],
  }
}
