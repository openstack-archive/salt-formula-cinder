cinder:
  controller:
    enabled: true
    version: liberty
    default_volume_type: lvmdriver-1
    backend:
      hp3par_backend:
        type_name: hp3par
        backend: hp3par_backend
        user: admin
        password: password  
        url: http://localhost/api/v1
        cpg: OpenStackCPG
        host: localhost
        login: admin
        sanpassword: password
        debug: True
        snapcpg: OpenStackSNAPCPG
        engine: hp3par
  volume:
    enabled: true
    version: liberty
    default_volume_type: lvmdriver-1
    backend:
      hp3par_backend:
        type_name: hp3par
        backend: hp3par_backend
        user: admin
        password: password  
        url: http://localhost/api/v1
        cpg: OpenStackCPG
        host: localhost
        login: admin
        sanpassword: password
        debug: True
        snapcpg: OpenStackSNAPCPG
        engine: hp3par
