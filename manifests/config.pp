class salus::config inherits salus {
    file { "/opt/salus/bin/.env":
        ensure => present,
        owner => "root",
        group => "root",
        mode => "0600",
        content => template('salus/env.erb'),
        require => File["/opt/salus"],
    }
}
