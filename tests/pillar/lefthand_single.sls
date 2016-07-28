cinder:
  volume:
    enabled: true
    version: liberty
    default_volume_type: lvmdriver-1
    backend:
      HP-LeftHand:
        type_name: normal-storage
        engine: hp_lefthand
        api_url: 'https://127.0.0.1:8081/lhos'
        username: username
        password: password
        clustername: cluster1
        iscsi_chap_enabled: false
  controller:
    enabled: true
    version: liberty
    default_volume_type: lvmdriver-1
    backend:
      HP-LeftHand:
        type_name: normal-storage
        engine: hp_lefthand
        api_url: 'https://127.0.0.1:8081/lhos'
        username: username
        password: password
        clustername: cluster1
        iscsi_chap_enabled: false
