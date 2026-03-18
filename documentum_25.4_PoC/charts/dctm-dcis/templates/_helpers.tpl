{{- define "dcis.saasproxy.callbacksAuthEndpoint.baseUrl" -}}
{{- if  .Values.saasproxy.callbacksAuthEndpoint }}
{{- $match :=  .Values.saasproxy.callbacksAuthEndpoint | toString | regexFind "(.*//.*?/)" -}}
{{- print $match -}}
{{- end }}
{{- end }}

{{- define "dcis.saasproxy.callbacksAuthEndpoint.urlPath" -}}
{{- if  .Values.saasproxy.callbacksAuthEndpoint }}
{{- $match :=  regexSplit "(.*//.*?/)" .Values.saasproxy.callbacksAuthEndpoint  -1 -}}
{{- range $index,$value := $match }}
{{- if eq $index 1 }}
{{- print  $value -}}
{{- end }}
{{- end }}
{{- end }}
{{- end }}

{{- define "dcis.saasproxy.callbacksPermsEndpoint.baseUrl" -}}
{{- if  .Values.saasproxy.callbacksPermsEndpoint }}
{{- $match :=  .Values.saasproxy.callbacksPermsEndpoint | toString | regexFind "(.*//.*?/)" -}}
{{- print $match -}}
{{- end }}
{{- end }}

{{- define "dcis.saasproxy.callbacksPermsEndpoint.urlPath" -}}
{{- if  .Values.saasproxy.callbacksPermsEndpoint }}
{{- $match :=  regexSplit "(.*//.*?/)" .Values.saasproxy.callbacksPermsEndpoint  -1 -}}
{{- range $index,$value := $match }}
{{- if eq $index 1 }}
{{- print  $value -}}
{{- end }}
{{- end }}
{{- end }}
{{- end }}

{{- define "dcis.saasproxy.callbacksDctmAuthEndpoint.baseUrl" -}}
{{- if  .Values.saasproxy.callbacksDctmAuthEndpoint }}
{{- $match :=  .Values.saasproxy.callbacksDctmAuthEndpoint | toString | regexFind "(.*//.*?/)" -}}
{{- print $match -}}
{{- end }}
{{- end }}

{{- define "dcis.saasproxy.callbacksDctmAuthEndpoint.urlPath" -}}
{{- if  .Values.saasproxy.callbacksDctmAuthEndpoint }}
{{- $match :=  regexSplit "(.*//.*?/)" .Values.saasproxy.callbacksDctmAuthEndpoint  -1 -}}
{{- range $index,$value := $match }}
{{- if eq $index 1 }}
{{- print  $value -}}
{{- end }}
{{- end }}
{{- end }}
{{- end }}

