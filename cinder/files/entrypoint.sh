{%- from "cinder/map.jinja" import controller with context -%}
#!/bin/bash -e

cat /srv/salt/pillar/cinder-controller.sls | envsubst > /tmp/cinder-controller.sls
mv /tmp/cinder-controller.sls /srv/salt/pillar/cinder-controller.sls

salt-call --local --retcode-passthrough state.highstate

{% for service in controller.services %}
service {{ service }} stop || true
{% endfor %}

if [ "$1" == "api" ]; then
    echo "starting cinder-api"
    su cinder --shell=/bin/sh -c '/usr/bin/cinder-api --config-file=/etc/cinder/cinder.conf'
elif [ "$1" == "scheduler" ]; then
    echo "starting cinder-scheduler"
    su cinder --shell=/bin/sh -c '/usr/bin/cinder-scheduler --config-file=/etc/cinder/cinder.conf'
elif [ "$1" == "volume" ]; then
    echo "starting cinder-volume"
    su cinder --shell=/bin/sh -c '/usr/bin/cinder-volume --config-file=/etc/cinder/cinder.conf'
else
    echo "No parameter submitted, don't know what to start" 1>&2
fi

{#-
vim: syntax=jinja
-#}
