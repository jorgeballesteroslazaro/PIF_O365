{{/*
This template file contains template functions that can be referred by sub-components
to fetch certain global fields. These functions ensure that the necessary global
variables are accessible and up-to-date.
*/}}

{{- define "documentum.envDomain" -}}
{{ .Release.Namespace }}.svc.cluster.local
{{- end }}

{{- define "documentum.internalIngress" -}}
{{ .Values.global.ingressProtocol }}://{{ .Values.global.hostShortName }}.{{ .Values.global.ingressDomain }}
{{- end }}

{{- define "documentum.internalIngressWithoutProtocol" -}}
{{ .Values.global.hostShortName }}.{{ .Values.global.ingressDomain }}
{{- end }}

{{- define "documentum.publicIngress" -}}
{{- if .Values.global.multiIngress -}}
{{ .Values.global.ingressProtocol }}://{{ .Values.global.publicHostShortName }}.{{ .Values.global.publicIngressDomain }}
{{- else -}}
{{ .Values.global.ingressProtocol }}://{{ .Values.global.hostShortName }}.{{ .Values.global.ingressDomain }}
{{- end }}
{{- end }}

{{- define "documentum.publicIngressWithoutProtocol" -}}
{{- if .Values.global.multiIngress -}}
{{ .Values.global.publicHostShortName }}.{{ .Values.global.publicIngressDomain }}
{{- else -}}
{{ .Values.global.hostShortName }}.{{ .Values.global.ingressDomain }}
{{- end }}
{{- end }}

{{- define "documentum.vpningressWithoutProtocol" -}}
{{- if .Values.global.multiIngress -}}
{{ .Values.global.vpnHostShortName }}.{{ .Values.global.vpnIngressDomain }}
{{- else -}}
{{ .Values.global.hostShortName }}.{{ .Values.global.ingressDomain }}
{{- end }}
{{- end }}

{{- define "documentum.vpnIngress" -}}
{{- if .Values.global.multiIngress -}}
{{ .Values.global.ingressProtocol }}://{{ .Values.global.vpnHostShortName }}.{{ .Values.global.vpnIngressDomain }}
{{- else -}}
{{ .Values.global.ingressProtocol }}://{{ .Values.global.hostShortName }}.{{ .Values.global.ingressDomain }}
{{- end }}
{{- end }}

{{- define "documentum.internalOtdsSvcUrl" -}}
{{ include "documentum.internalIngress" . }}/otdsws
{{- end }}

{{- define "documentum.publicOtdsSvcUrl" -}}
{{ include "documentum.publicIngress" . }}/otdsws
{{- end }}

{{- define "documentum.vpnOtdsSvcUrl" -}}
{{ include "documentum.vpnIngress" . }}/otdsws
{{- end }}

{{- define "documentum.publicDtrUrl" -}}
{{ include "documentum.publicIngress" . }}/dtr
{{- end }}

{{- define "formatNoProxy" -}}
{{- $noProxy := .Values.global.proxy.noProxy | default "" -}}
{{- $list := splitList "," $noProxy -}}
{{- join "|" $list -}}
{{- end }}
