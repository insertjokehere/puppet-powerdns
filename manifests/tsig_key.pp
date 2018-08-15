define powerdns::tsig_key($keyname=$name, $algorithm, $key) {
  exec { "import-tsig-${keyname}":
    command => "/usr/bin/pdnsutil import-tsig-key ${keyname} ${algorithm} ${key}",
    unless  => "/usr/bin/pdsnutil list-tsig-keys | /bin/grep ${keyname}"
  }
}
