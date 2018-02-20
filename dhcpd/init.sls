{% from "dhcpd/map.jinja" import dhcpd with context %}

{% if next_gen is not defined %}
{%   set next_gen = false %}
{% endif %}

include:
  - dhcpd.package
{% if not salt['pillar.get']('dhcpd:testing') %}
  - dhcpd.service
{% else %}
  - dhcpd.test
{% endif %}
