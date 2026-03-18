{{/*
  This template file contains utility functions for various operations, such as merging environment variables lists and
  resolving init-containers lists for a pod. These functions are designed to streamline and simplify common tasks.
*/}}

{{- define "mergeEnv" -}}

  {{- $lists := index . "lists" -}}
  {{- $nindent := index . "nindent" | default 2 -}}
  {{- $default := index $lists "default" -}}
  {{- $overrides := dict -}}

  {{- range $key, $list := $lists }}
    {{- range $list }}
      {{- $overrides = merge $overrides (dict .name .) -}}
    {{- end }}
  {{- end }}

  {{- $merged := list -}}
  {{- range $default }}
    {{- $merged = append $merged (index $overrides .name | default .) -}}
  {{- end }}

  {{- range $key, $list := $lists }}
    {{- range $list }}
      {{- $found := false -}}
      {{- $keyInList := .name -}}

      {{- range $merged }}
        {{- if eq .name $keyInList }}
          {{- $found = true -}}
        {{- end }}
      {{- end }}

      {{- if not $found }}
        {{- $merged = append $merged . -}}
      {{- end }}

    {{- end }}
  {{- end }}

  {{- $merged | toYaml | nindent $nindent -}}
{{- end }}


{{- define "resolveInitContainers" -}}
  {{- $initContainerLists := index . "initContainerLists" -}}
  {{- $globalValue := index . "global" -}}
  {{- $nindent := index . "nindent" | default 2 -}}
  {{- $filteredList := list }}
  {{- range $initContainerLists }}
    {{- if .component}}
      {{- $component := (eq .component "dsis" | ternary $globalValue.isVaultEnabled ((index $globalValue .component | default dict)).enabled) -}}
      {{- if $component }}
        {{- $filtered := dict }}
        {{- $repo := (empty (.repository | quote) | ternary $globalValue.repository .repository) }}
        {{- $_ := set $filtered "image" ((cat $repo .image) | replace " " "/") }}
        {{- $pullPolicy := (empty (.imagePullPolicy | quote) | ternary $globalValue.pullPolicyType .imagePullPolicy) }}
        {{- $_ := set $filtered "imagePullPolicy" $pullPolicy }}
        {{- range $key, $value := . }}
          {{- if and (ne $key "component") (ne $key "repository") (ne $key "image") (ne $key "imagePullPolicy") }}
            {{- $_ := set $filtered $key $value }}
          {{- end }}
        {{- end }}
        {{- $filteredList = append $filteredList $filtered }}
      {{- end }}
    {{- else }}
      {{- $filtered := dict }}
      {{- $repo := (empty (.repository | quote) | ternary $globalValue.repository .repository) }}
      {{- $_ := set $filtered "image" ((cat $repo .image) | replace " " "/") }}
      {{- $pullPolicy := (empty (.imagePullPolicy | quote) | ternary $globalValue.pullPolicyType .imagePullPolicy) }}
      {{- $_ := set $filtered "imagePullPolicy" $pullPolicy }}
      {{- range $key, $value := . }}
        {{- if and (ne $key "repository") (ne $key "image") (ne $key "imagePullPolicy") }}
          {{- $_ := set $filtered $key $value }}
        {{- end }}
      {{- end }}
      {{- $filteredList = append $filteredList $filtered }}
    {{- end }}
  {{- end }}
  {{ if $filteredList }}
  {{- $filteredList | toYaml | nindent $nindent -}}
  {{ end }}
{{- end }}



{{- define "ReportsCustomFilenames" -}}
  {{- $global := .global -}}
  {{- $result := list -}}

  {{- range $entry := .filenames -}}
    {{- $parts := splitList ":" (toString $entry) -}}
    {{- if eq (len $parts) 2 -}}
      {{- $docbase := trim (index $parts 0) -}}
      {{- $files := list -}}

      {{- range $file := splitList "," (trim (index $parts 1)) -}}
        {{- $file = trim $file -}}
        {{- if not (and (contains "DCTM-Reports-Application-" $file) $global.dtrbase (not $global.dtrbase.enabled)) -}}
          {{- $files = append $files $file -}}
        {{- end -}}
      {{- end -}}

      {{- if $files -}}
        {{- $result = append $result (printf "%s:%s" $docbase (join "," $files)) -}}
      {{- end -}}
    {{- else -}}
      {{- $result = append $result (toString $entry) -}}
    {{- end -}}
  {{- end -}}

  {{- join ";" $result | quote -}}
{{- end -}}
