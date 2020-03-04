class salus(
    $environment = "",
    $cert_email = "",
    $account_email,
    $renew_days_expire = 21,
    $dash_api_url,
    $dash_api_email,
    $dash_api_token,
    $aws_keyid,
    $aws_secret,
    $aws_trust_zoneid,
    $local_cert_store = "/etc/nginx/letsencrypt",
    $post_nginx = true,
    $nginx_config_test_cmd = "/usr/sbin/nginx -t",
    $nginx_reload_cmd = "/usr/sbin/service nginx restart",
    $nginx_sites_config = "/etc/nginx/sites-enabled",
    $force_renew = false,
    $raygun_api_key = false,
    $download_link,
    $cron_minute = "0",
    $cron_hour = "*/4",
    $cert_upload_cron_minute = undef,
    $cert_upload_cron_hour = undef,
) {
	class { 'salus::install': } ->
	class { 'salus::config': }
}
