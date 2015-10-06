{%- from "cinder/map.jinja" import controller with context %}
{%- if controller.enabled %}

include:
- cinder.user

cinder_controller_packages:
  pkg.installed:
  - names: {{ controller.pkgs }}

/etc/cinder/cinder.conf:
  file.managed:
  - source: salt://cinder/files/{{ controller.version }}/cinder.conf.controller.{{ grains.os_family }}
  - template: jinja
  - require:
    - pkg: cinder_controller_packages

/etc/cinder/api-paste.ini:
  file.managed:
  - source: salt://cinder/files/{{ controller.version }}/api-paste.ini.controller.{{ grains.os_family }}
  - template: jinja
  - require:
    - pkg: cinder_controller_packages

cinder_controller_services:
  service.running:
  - names: {{ controller.services }}
  - enable: true
  - watch:
    - file: /etc/cinder/cinder.conf
    - file: /etc/cinder/api-paste.ini

cinder_syncdb:
  cmd.run:
  - name: cinder-manage db sync
  - require:
    - service: cinder_controller_services

{% for type in controller.get('types', []) %}

cinder_type_create_{{ type.name }}:
  cmd.run:
  - name: "source /root/keystonerc; cinder type-create {{ type.name }}"
  - unless: "source /root/keystonerc; cinder type-list | grep {{ type.name }}"
  - require:
    - service: cinder_controller_services

cinder_type_update_{{ type.name }}:
  cmd.run:
  - name: "source /root/keystonerc; cinder type-key {{ type.name }} set volume_backend_name={{ type.get('backend', type.name) }}"
  - unless: "source /root/keystonerc; cinder extra-specs-list | grep \"{u'volume_backend_name': u'{{ type.get('backend', type.name) }}'}\""
  - require:
    - cmd: cinder_type_create_{{ type.name }}

{% endfor %}

{%- endif %}
