cinder:
  volume:
    enabled: true
    version: liberty
    default_volume_type: lvmdriver-1
    backend:
      solidfire:
        type_name: normal-storage
        engine: solidfire
        san_ip: 127.0.0.1
        san_login: username
        san_password: password
        clustername: cluster1
        sf_emulate_512: false
  controller:
    enabled: true
    version: liberty
    default_volume_type: lvmdriver-1
    backend:
      solidfire:
        type_name: normal-storage
        engine: solidfire
        san_ip: 127.0.0.1
        san_login: username
        san_password: password
        clustername: cluster1
        sf_emulate_512: false
