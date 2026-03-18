{{- define "dctm-dcc.syncagentservicePortNumber" -}}
{{- $tlsEnabled := (and .Values.global (eq .Values.global.internalTlsEnable true)) -}}
{{- $port := ternary 8443 (.Values.syncagent.service.servicePort | default 8080) $tlsEnabled -}}
{{- printf "%d" (int $port) -}}
{{- end -}}

{{- define "dctm-dcc.manualservicePortNumber" -}}
{{- $tlsEnabled := (and .Values.global (eq .Values.global.internalTlsEnable true)) -}}
{{- $port := ternary 8443 (.Values.syncnshareManual.service.servicePort | default 8080) $tlsEnabled -}}
{{- printf "%d" (int $port) -}}
{{- end -}}

{{- define "dctm-dcc.consulservicePortNumber" -}}
{{- $tlsEnabled := (and .Values.global (eq .Values.global.internalTlsEnable true)) -}}
{{- $port := ternary 8501 (.Values.consul.service.servicePort | default 8500) $tlsEnabled -}}
{{- printf "%d" (int $port) -}}
{{- end -}}
