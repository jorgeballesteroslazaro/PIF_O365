{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "lss.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "lss.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "lss.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Used to convert comma separated noProxy service list to pipe separated list, that will be used in noProxy settings
*/}}

{{- define "lss.formatNoProxy" -}}
{{- $noProxy := .Values.global.noproxy.services | default "" -}}
{{- $list := splitList "," $noProxy -}}
{{- join "|" $list -}}
{{- end }}

{{- define "dc4sp.url" -}}
{{ .Values.global.ingressProtocol }}://{{ .Values.dc4spService.host }}.{{ .Values.global.ingressDomain }}
{{- end }}

{{/*
Dynamically set the servicePort in an ingress rule based on whether TLS is enabled
*/}}
{{- define "lss.servicePort" -}}
{{- $sslPort := .Values.servicePort | default 8443 -}}
{{- $internalTlsEnable := default false (index .Values "global" "internalTlsEnable") -}}
{{- $port := ternary $sslPort 8080 $internalTlsEnable | int -}}
{{- printf "%d" $port -}}
{{- end -}}