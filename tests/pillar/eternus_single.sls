cinder:
  volume:
    enabled: true
    version: liberty
    backend:
      10kThinPro:
        type_name: 10kThinPro
        engine: fujitsu
        pool: 10kThinPro
        host: 127.0.0.1
        port: 5988
        user: username
        password: password
        connection: FC
        name: 10kThinPro
      10k_SAS:
        type_name: 10k_SAS
        pool: SAS10K
        engine: fujitsu
        host: 127.0.0.1
        port: 5988
        user: username
        password: password
        connection: FC
        name: 7k2RAID6
  controller:
    enabled: true
    version: liberty
    backend:
      10kThinPro:
        type_name: 10kThinPro
        engine: fujitsu
        pool: 10kThinPro
        host: 127.0.0.1
        port: 5988
        user: username
        password: password
        connection: FC
        name: 10kThinPro
      10k_SAS:
        type_name: 10k_SAS
        pool: SAS10K
        engine: fujitsu
        host: 127.0.0.1
        port: 5988
        user: username
        password: password
        connection: FC
        name: 7k2RAID6