Start forward syslog output by adding the following line to */etc/rsyslog.d/loghost.conf* . 

If file does not exist create a file.

```
*.* @FLUENTD_SYSLOG_HOST:42185
```

Replace `FLUENTD_SYSLOG_HOST` with IP or FQDN of this container/image.

Reference : http://www.fluentd.org/guides/recipes/rsyslogd-aggregation