# manifests/entry.pp

define add_facts::entry (
  String $value,
) {
  ini_setting { "add_facts ${title}":
    path    => '/opt/puppetlabs/facter/facts.d/add_facts.txt',
    setting => $title,
    value   => $value,
  }
}
