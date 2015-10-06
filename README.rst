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
        storage:
          engine: file
        types:
        - name: 7k2_SAS
        - name: 10k_SAS
        - name: 15k_SAS

    cinder:
      volume:
        enabled: true
        version: juno
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
        storage:
          engine: file
        types:
        - name: 7k2_SAS
        - name: 10k_SAS
        - name: 15k_SAS    

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
        version: juno
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
        storage:
          engine: file
        types:
        - name: 7k2_SAS
        - name: 10k_SAS
        - name: 15k_SAS

Cinder setup with IBM Storwize

.. code-block:: yaml

    cinder:
      controller:
        enabled: true
        types:
        - name: 7k2_SAS
          engine: storwize
          pool: SAS7K2
        - name: 10k_SAS
          pool: SAS10K
          engine: storwize
        - name: 15k_SAS
          pool: SAS15K
          engine: storwize
        storage:
          engine: storwize
          host: 192.168.0.1
          port: 22
          user: username
          password: pass
          connection: FC/iSCSI
          multihost: true
          multipath: true

Cinder setup with Hitachi VPS

.. code-block:: yaml

    cinder:
      controller:
        enabled: true
        types:
        - name: HUS100
          backend: hus100_backend
        storage:
          engine: hitachi_vsp
          connection: FC

Cinder setup with CEPH

.. code-block:: yaml

    cinder:
      controller:
        enabled: true
        types:
        - name: ceph
          backend: ceph_backend
          pool: volumes
        storage:
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
        types:
        - name: hp3par
          backend: hp3par_backend
        storage:
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
        types:
        - name: 10kThinPro
          engine: fujitsu
          pool: 10kThinPro
        - name: 10k_SAS
          pool: SAS10K
          engine: fujitsu
        storage:
          engine: fujitsu
          host: 192.168.0.1
          port: 5988
          user: username
          password: pass
          connection: FC/iSCSI

## Read more

* https://wiki.openstack.org/wiki/Cinder
* http://docs.openstack.org/juno/config-reference/content/hitachi-configuration.html
