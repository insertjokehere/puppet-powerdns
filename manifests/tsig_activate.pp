define powerdns::tsig_activate($keyname=$name, $zone, $role) {

  $meta = $role ? {
    'master' => 'TSIG-ALLOW-AXFR',
    'slave'  => 'AXFR-MASTER-TSIG',
    default  => ''
  }

  exec { "activate-tsig-${keyname}-${zone}":
    command => "/usr/bin/pdnsutil activate-tsig-key ${zone} ${keyname} ${role}",
    unless  => "/usr/bin/pdnsutil get-meta ${zone} ${meta} | /bin/grep ${keyname}"
  }
}
