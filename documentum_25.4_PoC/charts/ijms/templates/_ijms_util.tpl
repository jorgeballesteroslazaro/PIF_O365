{{/*
This template file contains template functions that can be referred by sub-components
to fetch certain global fields. These functions ensure that the necessary global
variables are accessible and up-to-date.
*/}}

{{- define "documentum.ijmsinternalIngress" -}}
{{ .Values.global.ingressProtocol }}://{{ .Values.global.hostShortName }}-ijms.{{ .Values.global.ingressDomain }}
{{- end }}
