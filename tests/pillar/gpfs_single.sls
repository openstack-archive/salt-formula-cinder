cinder:
  volume:
    enabled: true
    version: liberty
    backend:
      GPFS-GOLD:
        type_name: GPFS-GOLD
        engine: gpfs
        mount_point: '/mnt/gpfs-openstack/cinder/gold'
      GPFS-SILVER:
        type_name: GPFS-SILVER
        engine: gpfs
        mount_point: '/mnt/gpfs-openstack/cinder/silver'
  controller:
    enabled: true
    version: liberty
    backend:
      GPFS-GOLD:
        type_name: GPFS-GOLD
        engine: gpfs
        mount_point: '/mnt/gpfs-openstack/cinder/gold'
      GPFS-SILVER:
        type_name: GPFS-SILVER
        engine: gpfs
        mount_point: '/mnt/gpfs-openstack/cinder/silver'