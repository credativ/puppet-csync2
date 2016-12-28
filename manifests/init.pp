# = Class: csync2
#
# Module to manage csync2
#
# == Requirements:
#
# - This module makes use of the example42 functions in the puppi module
#   (https://github.com/credativ/puppet-example42lib)
#
# == Parameters:
#
# [* ensure *]
#   What state to ensure for the package. Accepts the same values
#   as the parameter of the same name for a package type.
#   Default: present
#
# [* manage_config *]
#   Whether to manage the configuration of csync2 or not.
#   Default: true
#   
# [* config_source *]
#   Specify a configuration source for the configuration. If this
#   is specified it is used instead of a template-generated configuration
#
# [* config_template *]
#   Override the default choice for the configuration template
#
# [* options *]
#    Allow to pass a custom options hash for use with a custom
#    config_template. This is not used by default.

class csync2 (
    $ensure             = $::csync2::params::ensure,
    $manage_config      = $::csync2::params::manage_config,
    $config_file        = $::csync2::params::config_file,
    $config_source      = $::csync2::params::config_source,
    $config_template    = $::csync2::params::config_template,
    $key                = $::csync2::params::key,
    $keyfile            = $::csync2::params::keyfile,
    $options            = $::csync2::params::options,
    ) inherits csync2::params {

    package { 'csync2':
        ensure => $ensure
    }

    file { $config_file:
        mode  => '0644',
        owner => 'root',
        group => 'root',
        tag   => 'csync2_config',
    }

    if $config_source {
        File <| tag == 'csync2_config' |> {
            source  => $config_source
        }
    } elsif $config_template {
        File <| tag == 'csync2_config' |> {
            content => template($config_template)
        }
    }

    file { $keyfile:
        ensure  => present,
        owner   => 'root',
        group   => 'root',
        mode    => '0600',
        content => $key,
    }
}

