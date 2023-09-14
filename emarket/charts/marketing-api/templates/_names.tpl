{{- define "suffix-name" -}}
{{- if .Values.global.app.name -}}
{{- .Values.global.app.name -}}
{{- else -}}
{{- .Release.Name -}}
{{- end -}}
{{- end -}}

{{- define "sql-name" -}}
{{- if .Values.global.sql.host -}}
{{- .Values.global.sql.host -}}
{{- else -}}
{{- printf "%s" "sql-data" -}}
{{- end -}}
{{- end -}}

{{- define "mongo-name" -}}
{{- if .Values.global.mongo.host -}}
{{- .Values.global.mongo.host -}}
{{- else -}}
{{- printf "%s" "nosql-data" -}}
{{- end -}}
{{- end -}}

{{- define "url-of" -}}
{{- $name := first .}}
{{- $ctx := last .}}
{{- if eq $name "" -}}
{{- $ctx.Values.global.k8s.dns -}}
{{- else -}}
{{- printf "%s/%s" $ctx.Values.global.k8s.dns $name -}}                {{/*Value is just <dns>/<name> */}}
{{- end -}}
{{- end -}}



{{- define "pathBase" -}}
{{- if .Values.global.k8s.suffix -}}
{{- $suffix := include "suffix-name" . -}}
{{- printf "%s-%s"  .Values.pathBase $suffix -}}
{{- else -}}
{{- .Values.pathBase -}}
{{- end -}}
{{- end -}}

{{- define "fqdn-image" -}}
{{- if .Values.global.image.registry -}}
{{- printf "%s/%s" .Values.global.image.registry.url .Values.image.repository -}}
{{- else -}}
{{- .Values.image.repository -}}
{{- end -}}
{{- end -}}

{{- define "protocol" -}}
{{- if .Values.global.tls.enabled -}}
{{- printf "%s" "https" -}}
{{- else -}}
{{- printf "%s" "http" -}}
{{- end -}}
{{- end -}}
