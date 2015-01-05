class csync2::params {
    $ensure         = 'present'
    $ensure_running = true
    $ensure_enabled = true
    $manage_config      = true
    $config_file        = '/etc/csync2.cfg'
    $keyfile            = '/etc/csync2.key':
    $config_template    = undef
    $config_source      = undef
    $disabled_hosts     = []
}

