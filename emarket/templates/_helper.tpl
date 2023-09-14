{{/* Validate values of Redis - must provide a valid architecture */}}
{{- define "basket-data.validateValues.architecture" -}}
{{- if and (ne .Values.global.redis.architecture "replication") ( .Values.global.redis.sentinel.master ) -}}
global:
  redis:
    architecture:
    sentinel:
      master:

    Invalid architecture selected. Valid values are "replication" and
    "sentinel.master". Please set a valid architecture (--set redis.architecture="xxxx")
{{- end -}}
{{- end -}}
