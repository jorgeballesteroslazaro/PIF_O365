{{- define "docbases" -}}
{{ range  .Values.global.extraDocbases }}
{{- if .name -}}
,{{( print .name ) }}
{{- end -}}
{{ end }}
{{- end -}}


{{- define "docbase.names" -}}
{{- if include "docbases" . -}}
{{ .Values.docbase.name | default .Values.global.docbase }}{{ include "docbases" . }}
{{- else -}}
{{ .Values.docbase.name | default .Values.global.docbase }}
{{- end -}}
{{- end -}}


