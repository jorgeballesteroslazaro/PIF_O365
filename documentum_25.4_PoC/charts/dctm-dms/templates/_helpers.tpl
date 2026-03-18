{{- define "dms.proxyUrl" -}}
{{- if .Values.proxy.port -}}
{{ .Values.proxy.protocol }}://{{ .Values.proxy.host }}:{{ .Values.proxy.port }}
{{- else -}}
{{ .Values.proxy.protocol }}://{{ .Values.proxy.host }}
{{- end }}
{{- end }}
