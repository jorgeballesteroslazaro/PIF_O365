{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "oesconnector.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Add following labels to config map metadata
*/}}
{{- define "configMap.labels" }}
  labels:
    app.kubernetes.io/name: {{ include "oesconnector.name" . }}
    app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
    app.kubernetes.io/component: {{ default .Chart.Name .Values.componentName | trunc 63 | trimSuffix "-" | replace " " "_" }}
    app.kubernetes.io/part-of: {{ default .Chart.Name .Values.appName | trunc 63 | trimSuffix "-" | replace " " "_" }}
    app.kubernetes.io/managed-by: helm
    app.kubernetes.io/chart-version: {{ .Chart.Version | quote }}
{{- end }}

{{- define "oesconnector.servicePortNumber" -}}
{{- $tlsEnabled := (and .Values.global (eq .Values.global.internalTlsEnable true)) -}}
{{- $port := ternary 8443 (.Values.servicePort | default 8080) $tlsEnabled -}}
{{- printf "%d" $port -}}
{{- end -}}

{{- define "oesconnector.servicePortString" -}}
{{ include "oesconnector.servicePortNumber" . | quote }}
{{- end -}}

