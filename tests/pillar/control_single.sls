cinder:
  controller:
    enabled: true
    version: liberty
    osapi:
      host: 127.0.0.1
    database:
      engine: mysql
      host:  localhost
      port: 3306
      name: cinder
      user: cinder
      password: password
    identity:
      engine: keystone
      host: 127.0.0.1
      region: RegionOne
      port: 35357
      tenant: service
      user: cinder
      password: password
    glance:
      host: 127.0.0.1
      port: 9292
    message_queue:
      engine: rabbitmq
      host: 127.0.0.1
      port: 5672
      user: openstack
      password: password
      virtual_host: '/openstack'
