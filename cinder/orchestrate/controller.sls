{%- if grains['saltversion'] >= "2016.3.0" %}

{# Batch execution is necessary - usable after 2016.3.0 release #}
cinder.controller:
  salt.state:
    - tgt: 'cinder:controller'
    - tgt_type: pillar
    - batch: 1
    - sls: cinder.controller
    - require:
      - salt: keystone.server

{%- else %}

{# Workaround for cluster with up to 3 members #}
cinder.controller:
  salt.state:
    - tgt: '*01* and I@cinder:controller'
    - tgt_type: compound
    - sls: cinder.controller
    - require:
      - salt: keystone.server

cinder.controller.02:
  salt.state:
    - tgt: '*02* and I@cinder:controller'
    - tgt_type: compound
    - sls: cinder.controller
    - require:
      - salt: keystone.server

cinder.controller.03:
  salt.state:
    - tgt: '*03* and I@cinder:controller'
    - tgt_type: compound
    - sls: cinder.controller
    - require:
      - salt: keystone.server

{%- endif %}

