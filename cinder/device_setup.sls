{%- from "cinder/map.jinja" import volume with context %}
{%- set loopback_device = volume.get('loopback_device', {}) %}
{%- if volume.enabled and loopback_device.local_file is defined %}

{{ salt['file.dirname'](loopback_device.local_file) }}:
  file.directory:
  - makedirs: true
  - require_in:
    - file: {{ loopback_device.local_file }}

{{ loopback_device.local_file }}:
  cmd.run:
  - name: truncate --size {{ loopback_device.size|default('1G') }} {{ loopback_device.local_file }}
  - creates: {{ loopback_device.local_file }}

/etc/init/cinder-device-setup.conf:
  file.managed:
  - source: salt://cinder/files/cinder-device-setup.conf
  - template: jinja
  - defaults:
    local_file: {{ loopback_device.local_file }}
    device_name: {{ loopback_device.device_name|default('/dev/loop0') }}

cinder-device-setup:
  service.running:
  - enable: false
  - require:
    - file: /etc/init/cinder-device-setup.conf
    - cmd: {{ loopback_device.local_file }}

{%- endif %}
