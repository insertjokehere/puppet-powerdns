define powerdns::tsig_key($keyname=$name, $algorithm, $key) {
  exec { "import-tsig-${keyname}":
    command => "/usr/bin/pdnsutil import-tsig-key ${keyname} ${algorithm} ${key}",
    unless  => "/usr/bin/pdnsutil list-tsig-keys | /bin/grep ${keyname}"
  }
}
