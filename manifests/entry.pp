# manifests/entry.pp

define add_facts::entry (
  $ensure       = present,
  String $value = '',
) {
  ini_setting { "add_facts ${title}":
    ensure            => $ensure,
    path              => "${add_facts::directory}/add_facts.yaml",
    setting           => $title,
    value             => $value,
    key_val_separator => ': ',
  }
}
