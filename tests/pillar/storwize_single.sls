cinder:
  volume:
    enabled: true
    version: liberty
    default_volume_type: lvmdriver-1
    backend:
      7k2_SAS:
        engine: storwize
        type_name: 7k2_SAS
        host: 127.0.0.1
        port: 22
        user: username
        password: password
        connection: FC
        multihost: true
        multipath: true
        pool: SAS7K2
      10k_SAS:
        engine: storwize
        type_name: 10k_SAS
        host: 127.0.0.1
        port: 22
        user: username
        password: password
        connection: FC
        multihost: true
        multipath: true
        pool: SAS10K
      15k_SAS:
        engine: storwize
        type_name: 15k_SAS
        host: 127.0.0.1
        port: 22
        user: username
        password: password
        connection: FC
        multihost: true
        multipath: true
        pool: SAS15K
  controller:
    enabled: true
    version: liberty
    default_volume_type: lvmdriver-1
    backend:
      7k2_SAS:
        engine: storwize
        type_name: 7k2_SAS
        host: 127.0.0.1
        port: 22
        user: username
        password: password
        connection: FC
        multihost: true
        multipath: true
        pool: SAS7K2
      10k_SAS:
        engine: storwize
        type_name: 10k_SAS
        host: 127.0.0.1
        port: 22
        user: username
        password: password
        connection: FC
        multihost: true
        multipath: true
        pool: SAS10K
      15k_SAS:
        engine: storwize
        type_name: 15k_SAS
        host: 127.0.0.1
        port: 22
        user: username
        password: password
        connection: FC
        multihost: true
        multipath: true
        pool: SAS15K
