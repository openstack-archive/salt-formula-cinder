{%- from "cinder/map.jinja" import volume with context %}
{%- if volume.enabled and volume.get('loopback_device', {}).local_file is defined %}

{{ salt['file.dirname'](volume.loopback_device.local_file) }}:
  file.directory:
  - makedirs: true
  - require_in:
    - file: {{ volume.loopback_device.local_file }}

{{ volume.loopback_device.local_file }}:
  cmd.run:
  - name: truncate --size {{ loopback_device.size|default('10G') }} {{ volume.loopback_device.local_file }}
  - creates: {{ volume.loopback_device.local_file }}

/etc/init/cinder-device-setup.conf:
  file.managed:
  - source: salt://cinder/files/cinder-device-setup.conf
  - template: jinja
  - defaults:
    local_file: {{ volume.loopback_device.local_file }}

cinder-device-setup:
  service.running:
  - enable: false
  - require:
    - file: /etc/init/cinder-device-setup.conf
    - cmd: {{ volume.loopback_device.local_file }}

{%- endif %}
