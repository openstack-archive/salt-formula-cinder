cinder:
  controller:
    enabled: true
    version: liberty
    osapi:
      host: 127.0.0.1
    database:
      engine: mysql
      host: 127.0.0.1
      port: 3306
      name: cinder
      user: cinder
      password: password
    identity:
      engine: keystone
      region: RegionOne
      host: 127.0.0.1
      port: 35357
      tenant: service
      user: cinder
      password: password
    glance:
      host: 127.0.0.1
      port: 9292
    message_queue:
      engine: rabbitmq
      members:
      - host: 127.0.0.1
      - host: 127.0.1.1
      - host: 127.0.2.1
      user: openstack
      password: password
      virtual_host: '/openstack'
    cache:
      engine: memcached
      members:
      - host: 127.0.0.1
        port: 11211
      - host: 127.0.0.1
        port: 11211
      - host: 127.0.0.1
        port: 11211

    audit:
      filter_factory: 'keystonemiddleware.audit:filter_factory'
      map_file: '/etc/pycadf/cinder_api_audit_map.conf'
