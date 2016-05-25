# manifests/entry.pp

define add_facts::entry (
  $ensure       = present,
  String $value = '',
) {
  ini_setting { "add_facts ${title}":
    ensure            => $ensure,
    path              => '/opt/puppetlabs/facter/facts.d/add_facts.yaml',
    setting           => $title,
    value             => $value,
    key_val_separator => ': ',
  }
}
