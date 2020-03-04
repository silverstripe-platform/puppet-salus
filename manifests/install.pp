# Module expects PHP cli already installed with
# mcrypt, JSON, curl and openssl support
class salus::install inherits salus {
    $salus_dirs = [
        '/opt/salus',
        '/opt/salus/bin',
        '/opt/salus/data',
    ]

    file { $salus_dirs:
        ensure => 'directory',
        owner  => 'root',
        group  => 'root',
        mode   => '0750',
    }

    file { $local_cert_store:
        ensure => 'directory',
        owner  => 'root',
        group  => 'root',
        mode   => '0700',
    }

    # Install phar
    servicetools::install_file { "/opt/salus/bin/salus":
        source => $download_link,
    }

    # Set up cron
    file { "/etc/cron.d/salus":
        ensure => "file",
        owner => "root",
        group => "root",
        mode => "0644",
        content => "${cron_minute} ${cron_hour} * * * root cd /opt/salus/bin && ./salus 2>&1 | logger -t salus\n",
    }

    # Set up the cron for uploading certificates to the Dashboard, if parameters are set
    if $cert_upload_cron_minute and $cert_upload_cron_hour {
        file { "/etc/cron.d/salus-upload":
            ensure => "file",
            owner => "root",
            group => "root",
            mode => "0644",
            content => "${cert_upload_cron_minute} ${cert_upload_cron_hour} * * * root cd /opt/salus/bin && ./salus certificate:upload --all 2>&1 | logger -t salus\n",
        }
    }
}
