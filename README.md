# puppet-salus

Manage the installation and configuration of our Let's Encrypt tool [`salus`](https://github.com/silverstripeltd/salus)

## Installation

Module expects PHP curl and json extensions to be installed already.

Certificates and keys are named `{stack-env}.crt` and `{stack-env}.key`. Any nginx template will need to use this naming convention.

In your PuppetFile add
```
mod 'silverstripe-salus',
	:git => 'git@github.com:silverstripeltd/puppet-salus.git'
```

## Configuration

By default, sets up cron job in `/etc/cron.d` to run every 4 hours, on the hour eg. `00:00`, `04:00`, `08:00` ...

``` ruby
class { salus:
    $environment, # Prodduction/Staging
    $cert_email, # Defaults to account_email
    $account_email, # Registered with Let's Encrypt
    $renew_days_expire,
    $dash_api_url,
    $dash_api_email,
    $dash_api_token,
    $aws_keyid,
    $aws_secret,
    $aws_trust_zoneid,
    $local_cert_store, # Where salus will store locally store certs
    $post_nginx, # If true salus will test nginx config
    $nginx_config_test_cmd,
    $nginx_reload_cmd,
    $nginx_sites_config, # nginx vhost conf files
    $force_renew, # Only set to true if using staging env
    $raygun_api_key,
    $download_link, # URL to download salus binary
    $cron_minute, # Default 0 min
    $cron_hour, # Default */4
}
```