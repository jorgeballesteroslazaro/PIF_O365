{{- /*
mychart.shortname provides a 6 char truncated version of the release name.
*/ -}}
{{- define "dctm-rest.release-labels" }}
app: {{ .Release.Name }}-{{ .Chart.Name }}-{{ .Chart.Version | replace "+" "_" }}
version: {{ .Chart.Version }}
release: {{ .Release.Name }}
{{- end }}

{{- define "dctm-rest.custom-labels" }}
{{- range $key, $val := .Values.customLabels }}
{{ $key }}: {{ $val }}
{{- end}}
{{- end }}

{{- define "dctm-rest.fullname" -}}
{{ .Release.Name }}-{{ .Chart.Name }}
{{- end }}

{{/* vim: set filetype=mustache: */}}

{{- define "dctm-rest.servicePort" -}}
{{- $sslPort := .Values.servicePort | default 8443 -}}
{{- $internalTlsEnable := default false (index .Values "global" "internalTlsEnable") -}}
{{- $port := ternary $sslPort 8080 $internalTlsEnable | int -}}
{{- printf "%d" $port -}}
{{- end -}}