# manifests/entries.pp

class add_facts::entries (
  Hash $args = {},
){
  create_resources(add_facts::entry, $args)
}
