{{/* vim: set filetype=mustache: */}}
{{/*
Establish the name depending on whether or not to use the release name.
*/}}
{{- define "otdsws.name" -}}
{{- if eq .Values.global.otdsUseReleaseName true }}
{{- printf "%s-%s" .Release.Name .Chart.Name -}}
{{- else }}
{{- printf "%s" .Chart.Name -}}
{{- end }}
{{- end -}}
{{/*
Establish the service name depending on whether or not to use the release name.
*/}}
{{- define "otdsws.service" -}}
{{- $servicename := default .Values.global.otdsServiceName .Values.serviceName -}}
{{- if eq .Values.global.otdsUseReleaseName true }}
{{- printf "%s-%s" .Release.Name $servicename -}}
{{- else }}
{{- printf "%s" $servicename -}}
{{- end }}
{{- end -}}

{{/*
Establish the DB url to use
*/}}
{{- define "otdsws.dburl" -}}
{{- if .Values.otdsdb.url -}}
{{- printf "%s" .Values.otdsdb.url -}}
{{- else if not .Values.otdsdb.name  -}}
{{ fail "A valid otdsws.otdsdb.url or otdsws.otdsdb.name is required!" }}
{{- else if eq .Values.global.database.type "oracle" -}}
jdbc:oracle:thin:@//{{ .Values.global.database.hostname }}:{{ .Values.global.database.port }}/{{ .Values.global.database.adminDatabase }}
{{- else if eq .Values.global.database.type "mssql" -}}
jdbc:sqlserver://{{ .Values.global.database.hostname }}:{{ .Values.global.database.port }};databaseName={{ .Values.otdsdb.name }};integratedSecurity=false;encrypt={{ .Values.global.database.ssl }};trustServerCertificate=true
{{- else -}}
jdbc:postgresql://{{ .Values.global.database.hostname }}:{{ .Values.global.database.port }}/{{.Values.otdsdb.name }}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "otdsws.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{/*
Common labels
*/}}
{{- define "otdsws.labels" -}}
app.kubernetes.io/name: {{ include "otdsws.name" . }}
helm.sh/chart: {{ include "otdsws.chart" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}
{{/*
Establish Pre Upgrade Job image tag
*/}}
{{- define "preupgrade.job.image.tag" -}}
{{- if .Values.migration.preUpgradeJob.image.tag -}}
{{ .Values.migration.preUpgradeJob.image.tag }}
{{- else }}
latest
{{- end }}
{{- end -}}
{{/*
Establish the DB host from the JDBC URL
*/}}
{{- define "otdsdb.url.host" -}}
{{- if .Values.otdsdb.url -}}
{{ .Values.otdsdb.url | trimPrefix "jdbc:postgresql://" | regexFind "^[^:]+" | quote }}
{{- else -}}
{{ .Values.global.database.hostname }}
{{- end -}}
{{- end -}}
{{/*
Establish the DB port from the JDBC URL
*/}}
{{- define "otdsdb.url.port" -}}
{{- if .Values.otdsdb.url -}}
{{ .Values.otdsdb.url | trimPrefix "jdbc:postgresql://" | regexFind "[:][0-9]+" | trimPrefix ":" | quote }}
{{- else -}}
{{ .Values.global.database.port | quote }}
{{- end -}}
{{- end -}}
{{/*
Establish the DB type from the JDBC URL
*/}}
{{- define "otdsdb.url.type" -}}
{{- if .Values.otdsdb.url -}}
{{ .Values.otdsdb.url | trimPrefix "jdbc:" | regexFind "^[^:]+" | quote }}
{{- else -}}
{{ .Values.global.database.type }}
{{- end -}}
{{- end -}}
{{/*
Establish the DB name from the JDBC URL
*/}}
{{- define "otdsdb.url.name" -}}
{{- if .Values.otdsdb.url -}}
{{ .Values.otdsdb.url | trimPrefix "jdbc:postgresql://" | regexFind "[^/]+$" | regexFind "[^?]+" | quote }}
{{- else -}}
{{ eq .Values.global.database.type "oracle" | ternary .Values.global.database.adminDatabase .Values.otdsdb.name }}
{{- end -}}
{{- end -}}
{{/*
Create String of database extensions with ',' as separator.
*/}}
{{- define "otdsdb.extensions" -}}
{{- range .Values.otdsdb.automaticDatabaseCreation.dbExtensions -}}
{{- printf "%s%s" . "," -}}
{{- end }}
{{- end -}}
{{/*
OTDS server image
*/}}
{{- define "otds.image" -}}
{{- $imgsrc := default .Values.global.imageSource .Values.image.source }}
{{- $imgname := .Values.image.name }}
{{- $imgtag := .Values.image.tag }}
{{- if $imgsrc }}
  {{- if (regexFind "\\/$" $imgsrc ) }}
    {{- printf "%s%s:%s" $imgsrc $imgname $imgtag -}}
  {{- else }}
    {{- printf "%s/%s:%s" $imgsrc $imgname $imgtag -}}
  {{- end }}
{{- else }}
  {{- printf "%s:%s" $imgname $imgtag -}}
{{- end }}
{{- end -}}
{{/*
database image e.g. for psql client running DB init
*/}}
{{- define "db.image" -}}
{{- $dbimgsrc := default .Values.global.imageSourcePublic .Values.otdsdb.automaticDatabaseCreation.dbImage.source }}
{{- $dbimgname := $.Values.otdsdb.automaticDatabaseCreation.dbImage.name }}
{{- $dbimgtag := $.Values.otdsdb.automaticDatabaseCreation.dbImage.tag }}
{{- if $dbimgsrc }}
  {{- if (regexFind "\\/$" $dbimgsrc ) }}
    {{- printf "%s%s:%s" $dbimgsrc $dbimgname $dbimgtag -}}
  {{- else }}
    {{- printf "%s/%s:%s" $dbimgsrc $dbimgname $dbimgtag -}}
  {{- end }}
{{- else }}
  {{- printf "%s:%s" $dbimgname $dbimgtag -}}
{{- end }}
{{- end -}}
{{/*
Establish the configmap name of initdb script depending on whether or not to use the release name.
*/}}
{{- define "initdb.script" -}}
{{- if eq .Values.global.otdsUseReleaseName true }}
{{- printf "%s-%s" .Release.Name "initdb-script" -}}
{{- else }}
{{- printf "%s" "initdb-script" -}}
{{- end }}
{{- end -}}
{{/*
Path to otdsws
*/}}
{{- define "otdsws.path" -}}
{{- if .Values.ingress.prependPath }}
{{- printf "/%s/otdsws" .Values.ingress.prependPath -}}
{{- else }}
{{- "/otdsws" -}}
{{- end }}
{{- end -}}

{{- define "getExtraPodMatchLabels" -}}
{{ range $key, $value := .Values.global.extraPodMatchLabels -}}
{{ $key }}: {{ $value | quote }}
{{ end }}
{{- end -}}
