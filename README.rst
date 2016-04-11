==============================
Openstack Cinder Block Storage
==============================

Cinder provides an infrastructure for managing volumes in OpenStack. It was originally a Nova component called nova-volume, but has become an independent project since the Folsom release.

Sample pillars
==============

New structure divides cinder-api,cinder-scheduler to role controller and cinder-volume to role volume.

.. code-block:: yaml

    cinder:
      controller:
        enabled: true
        version: juno
        default_volume_type: 7k2SaS
        database:
          engine: mysql
          host: 127.0.0.1
          port: 3306
          name: cinder
          user: cinder
          password: pwd
        identity:
          engine: keystone
          host: 127.0.0.1
          port: 35357
          tenant: service
          user: cinder
          password: pwd
        message_queue:
          engine: rabbitmq
          host: 127.0.0.1
          port: 5672
          user: openstack
          password: pwd
          virtual_host: '/openstack'
        backend:
          7k2_SAS:
            engine: storwize
            type_name: slow-disks
            host: 192.168.0.1
            port: 22
            user: username
            password: pass
            connection: FC/iSCSI
            multihost: true
            multipath: true
            pool: SAS7K2

    cinder:
      volume:
        enabled: true
        version: juno
        default_volume_type: 7k2SaS
        database:
          engine: mysql
          host: 127.0.0.1
          port: 3306
          name: cinder
          user: cinder
          password: pwd
        identity:
          engine: keystone
          host: 127.0.0.1
          port: 35357
          tenant: service
          user: cinder
          password: pwd
        message_queue:
          engine: rabbitmq
          host: 127.0.0.1
          port: 5672
          user: openstack
          password: pwd
          virtual_host: '/openstack'
        backend:
          7k2_SAS:
            engine: storwize
            type_name: 7k2 SAS disk
            host: 192.168.0.1
            port: 22
            user: username
            password: pass
            connection: FC/iSCSI
            multihost: true
            multipath: true
            pool: SAS7K2

Cinder setup with zeroing deleted volumes

    cinder:
      controller:
        enabled: true
        wipe_method: zero
        ...

Cinder setup with shreding deleted volumes

.. code-block:: yaml

    cinder:
      controller:
        enabled: true
        wipe_method: shred
        ...


Default Cinder setup with iSCSI target

.. code-block:: yaml

    cinder:
      controller:
        enabled: true
        version: mitaka
        default_volume_type: lvmdriver-1
        database:
          engine: mysql
          host: 127.0.0.1
          port: 3306
          name: cinder
          user: cinder
          password: pwd
        identity:
          engine: keystone
          host: 127.0.0.1
          port: 35357
          tenant: service
          user: cinder
          password: pwd
        message_queue:
          engine: rabbitmq
          host: 127.0.0.1
          port: 5672
          user: openstack
          password: pwd
          virtual_host: '/openstack'
        backend:
          lvmdriver-1:
            engine: lvm
            type_name: lvmdriver-1
            volume_group: cinder-volume

Cinder setup for IBM Storwize

.. code-block:: yaml

    cinder:
      volume:
        enabled: true
        backend:
          7k2_SAS:
            engine: storwize
            type_name: 7k2 SAS disk
            host: 192.168.0.1
            port: 22
            user: username
            password: pass
            connection: FC/iSCSI
            multihost: true
            multipath: true
            pool: SAS7K2
          10k_SAS:
            engine: storwize
            type_name: 10k SAS disk
            host: 192.168.0.1
            port: 22
            user: username
            password: pass
            connection: FC/iSCSI
            multihost: true
            multipath: true
            pool: SAS10K
          15k_SAS:
            engine: storwize
            type_name: 15k SAS
            host: 192.168.0.1
            port: 22
            user: username
            password: pass
            connection: FC/iSCSI
            multihost: true
            multipath: true
            pool: SAS15K

Cinder setup with Hitachi VPS

.. code-block:: yaml

    cinder:
      controller:
        enabled: true
        backend:
          hus100_backend:
            type_name: HUS100
            backend: hus100_backend
            engine: hitachi_vsp
            connection: FC

Cinder setup with CEPH

.. code-block:: yaml

    cinder:
      controller:
        enabled: true
        backend:
          ceph_backend:
            type_name: standard-iops
            backend: ceph_backend
            pool: volumes
            engine: ceph
            user: cinder
            secret_uuid: da74ccb7-aa59-1721-a172-0006b1aa4e3e
            client_cinder_key: AQDOavlU6BsSJhAAnpFR906mvdgdfRqLHwu0Uw==

http://ceph.com/docs/master/rbd/rbd-openstack/


Cinder setup with HP3par

.. code-block:: yaml

    cinder:
      controller:
        enabled: true
        backend:
          hp3par_backend:
            type_name: hp3par
            backend: hp3par_backend
            user: hp3paruser
            password: something
            url: http://10.10.10.10/api/v1
            cpg: OpenStackCPG
            host: 10.10.10.10
            login: hp3paradmin
            sanpassword: something
            debug: True
            snapcpg: OpenStackSNAPCPG

Cinder setup with Fujitsu Eternus

.. code-block:: yaml

    cinder:
      volume:
        enabled: true
        backend:
          10kThinPro:
            type_name: 10kThinPro
            engine: fujitsu
            pool: 10kThinPro
            host: 192.168.0.1
            port: 5988
            user: username
            password: pass
            connection: FC/iSCSI
            name: 10kThinPro
          10k_SAS:
            type_name: 10k_SAS
            pool: SAS10K
            engine: fujitsu
            host: 192.168.0.1
            port: 5988
            user: username
            password: pass
            connection: FC/iSCSI
            name: 10k_SAS

Cinder setup with IBM GPFS filesystem

.. code-block:: yaml

    cinder:
      volume:
        enabled: true
        backend:
          GPFS-GOLD:
            type_name: GPFS-GOLD
            engine: gpfs
            mount_point: '/mnt/gpfs-openstack/cinder/gold'
          GPFS-SILVER:
            type_name: GPFS-SILVER
            engine: gpfs
            mount_point: '/mnt/gpfs-openstack/cinder/silver'
  
Cinder setup with HP LeftHand

.. code-block:: yaml

    cinder:
      volume:
        enabled: true
        backend:
          HP-LeftHand:
            type_name: normal-storage
            engine: hp_lefthand
            api_url: 'https://10.10.10.10:8081/lhos'
            username: user
            password: password
            clustername: cluster1
            iscsi_chap_enabled: false

Extra parameters for HP LeftHand

.. code-block:: yaml

    cinder type-key normal-storage set hplh:data_pl=r-10-2 hplh:provisioning=full 

Cinder setup with Solidfire

.. code-block:: yaml

    cinder:
      volume:
        enabled: true
        backend:
          solidfire:
            type_name: normal-storage
            engine: solidfire
            san_ip: 10.10.10.10
            san_login: user
            san_password: password
            clustername: cluster1
            sf_emulate_512: false
## Read more

* https://wiki.openstack.org/wiki/Cinder
* http://docs.openstack.org/juno/config-reference/content/hitachi-configuration.html
