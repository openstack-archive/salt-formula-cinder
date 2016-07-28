cinder:
  controller:
    enabled: true
    version: liberty
    backend:
      hus100_backend:
        storage_id: 1010
        pool_id: 11
        thin_pool_id: 21
        target_ports: CL3-B
        compute_target_ports: CL1-E,CL2-E,CL3-B,CL4-D
        user: root
        password: password
        type_name: HUS100
        backend: hus100_backend
        engine: hitachi_vsp
        connection: FC
  volume:
    enabled: true
    version: liberty
    backend:
      hus100_backend:
        #storage_id: 0001
        type_name: HUS100
        backend: hus100_backend
        engine: hitachi_vsp
        connection: FC

