{{- if and .Values.global.existingSecret .Values.global.secretlink.enabled  }}
    {{- fail "global.existingSecret and global.secretlink.enabled cannot both be be set\n" }}
{{- else if and .Values.existingSecret .Values.global.secretlink.enabled  }}
    {{- fail "existingSecret and global.secretlink.enabled cannot both be be set\n" }}
{{- else if and .Values.global.otivSecretProviderClass.enabled .Values.global.secretlink.enabled  }}
    {{- fail "global.otivSecretProviderClass.enabled and global.secretlink.enabled cannot both be be set\n" }}
{{- else if and .Values.global.otivSecretProviderClass.enabled .Values.global.existingSecret  }}
    {{- fail "global.otivSecretProviderClass.enabled and global.existingSecret cannot both be be set\n" }}
{{- else if and .Values.global.otivSecretProviderClass.enabled .Values.existingSecret  }}
    {{- fail "global.otivSecretProviderClass.enabled and existingSecret cannot both be be set\n" }}
{{- end }}

{{- if .Values.global.otivSecretProviderClassCerts.enabled }}
    {{- if .Values.global.enableOtivCustomizedTruststore  }}
        {{- fail "global.otivSecretProviderClassCerts.enabled and global.enableOtivCustomizedTruststore cannot both be be set\n" }}
    {{- else if .Values.global.existingOtivCustomizedCertSecret  }}
        {{- fail "global.otivSecretProviderClassCerts.enabled and global.existingOtivCustomizedCertSecret cannot both be be set\n" }}
    {{- else if .Values.singleCaCert }}
        {{- fail "global.otivSecretProviderClassCerts.enabled and singleCaCert cannot both be be set\n" }}
    {{- else if .Values.global.otivSecretProviderClassCerts.secrets | empty }}
        {{- fail "Array property global.otivSecretProviderClassCerts.secrets must be set since global.otivSecretProviderClassCerts.enabled is set\n" }}
    {{- end }}
{{- end }}

{{- if .Values.global.otivSecretProviderClass.enabled }}
    {{- if not .Values.global.otivSecretProviderClass.saRole }}
        {{- fail "global.otivSecretProviderClass.saRole must be set since global.otivSecretProviderClass.enabled is set\n" }}
    {{- end }}
{{- else if .Values.global.otivSecretProviderClassCerts.enabled }}
    {{- if not .Values.global.otivSecretProviderClassCerts.saRole }}
        {{- fail "global.otivSecretProviderClassCerts.saRole must be set since global.otivSecretProviderClassCerts.enabled is set\n" }}
    {{- end }}
{{- end }}

{{- if and (not .Values.global.secretlink.enabled) (not .Values.global.existingSecret) (not .Values.global.otivSecretProviderClass.enabled) (not .Values.global.ocp) }}
    {{- if and (not .Values.existingSecret) .Values.amqp.enabled (not .Values.global.amqp.password) }}
        {{- fail "global.amqp.password value must be set\n" }}
    {{- end }}
    {{- if and (not .Values.existingSecret)  (not .Values.global.masterPassword) }}
        {{- fail "global.masterPassword value must be set\n" }}
    {{- end }}
    {{- if and (not .Values.existingSecret) (not .Values.global.database.adminPassword) }}
        {{- fail "global.database.adminPassword value must be set\n" }}
    {{- end }}
    {{- if and (not .Values.existingSecret) (not .Values.global.database.ivPassword) }}
        {{- fail "global.database.ivPassword value must be set\n" }}
    {{- end }}
    {{- if and .Values.otds.enabled (not .Values.otds.otdsws.otdsdb.password) }}
        {{- fail "otds.otdsws.otdsdb.password value must be set\n" }}
    {{- end }}
    {{- if and .Values.otds.enabled (not .Values.otds.otdsws.cryptKey) }}
        {{- fail "otds.otdsws.cryptKey value must be set\n" }}
    {{- end }}
{{- end }}

{{- if and (ne .Values.global.database.type "oracle") (ne .Values.global.database.type "postgresql") (ne .Values.global.database.type "mssql") }}
	{{- fail "global.database.type must be  postgresql or oracle or mssql" }}
{{- end}}
{{- if .Values.global.topologyScheduling }}
    {{- if and (ne .Values.global.topologyScheduling "DoNotSchedule") (ne .Values.global.topologyScheduling "ScheduleAnyway") }}
        {{- fail "if global.topologyScheduling is set, it's value must be either DoNotSchedule or ScheduleAnyway" }}
    {{- end}}
{{- end}}

{{- if and .Values.global.existingSecret (not .Values.global.otivSecretProviderClass.enabled) (not .Values.global.ocp) (not .Values.global.skipExistingSecretLookup) }}
    {{- $secret_object := lookup "v1" "Secret" .Release.Namespace .Values.global.existingSecret }}
    {{- if not $secret_object }}
        {{- fail "\n\nError: existing secret defined at global.existingSecret not found.\n" }}
    {{- else if not $secret_object.data }}
        {{- fail "\n\nError: keys from the existing secret set at global.existingSecret must be defined under the data section.\n" }}
    {{- end }}
    {{- $secrets := $secret_object.data }}
    {{- if not (index $secrets "rabbitmq-password") }}
        {{- fail "\n\nError: existing secret from global.existingSecret must set rabbitmq-password\n" }}
    {{- end }}
    {{- if not (index $secrets "ADMIN_USER_PASSWORD") }}
        {{- fail "\n\nError: existing secret from global.existingSecret must set ADMIN_USER_PASSWORD\n" }}
    {{- end }}
    {{- if not (index $secrets "OTIV_DB_ADMIN_PASSWORD") }}
        {{- fail "\n\nError: existing secret from global.existingSecret must set OTIV_DB_ADMIN_PASSWORD\n" }}
    {{- end }}
    {{- if not (index $secrets "OTIV_DB_PASSWORD") }}
        {{- fail "\n\nError: existing secret from global.existingSecret for iv must set OTIV_DB_PASSWORD\n" }}
    {{- end }}
    {{- if not (index $secrets "OTDS_JAKARTA_PERSISTENCE_JDBC_PASSWORD") }}
        {{- fail "\n\nError: existing secret from global.existingSecret must set OTDS_JAKARTA_PERSISTENCE_JDBC_PASSWORD\n" }}
    {{- end }}
    {{- if .Values.otds.enabled  }}
        {{- if not (index $secrets "OTDS_DIRECTORY_BOOTSTRAP_INITIALPASSWORD") }}
            {{- fail "\n\nError: existing secret from global.existingSecret must set OTDS_DIRECTORY_BOOTSTRAP_INITIALPASSWORD\n" }}
        {{- end }}
        {{- if not (index $secrets "OTDS_DIRECTORY_BOOTSTRAP_CRYPTSECRET") }}
            {{- fail "\n\nError: existing secret from global.existingSecret must set OTDS_DIRECTORY_BOOTSTRAP_CRYPTSECRET\n" }}
        {{- end }}
        {{- if ne $secrets.ADMIN_USER_PASSWORD $secrets.OTDS_DIRECTORY_BOOTSTRAP_INITIALPASSWORD }}
            {{- fail "\n\nError: existing secret from global.existingSecret must have the same values for ADMIN_USER_PASSWORD and OTDS_DIRECTORY_BOOTSTRAP_INITIALPASSWORD.\n" }}
        {{- end }}
    {{- end }}
{{- end }}

{{- if and .Values.existingSecret (not .Values.global.otivSecretProviderClass.enabled) (not .Values.global.ocp) (not .Values.global.skipExistingSecretLookup) }}
    {{- $secret_object := lookup "v1" "Secret" .Release.Namespace .Values.existingSecret }}
    {{- if not $secret_object }}
        {{- fail "\n\nError: existing secret defined at existingSecret not found.\n" }}
    {{- else if not $secret_object.data }}
        {{- fail "\n\nError: keys from the existing secret set at existingSecret must be defined under the data section.\n" }}
    {{- end }}
    {{- $secrets := $secret_object.data }}
    {{- if not (index $secrets "rabbitmq-password") }}
        {{- fail "\n\nError: existing secret from existingSecret must set rabbitmq-password\n" }}
    {{- end }}
    {{- if not (index $secrets "ADMIN_USER_PASSWORD") }}
        {{- fail "\n\nError: existing secret from existingSecret must set ADMIN_USER_PASSWORD\n" }}
    {{- end }}
    {{- if not (index $secrets "OTIV_DB_ADMIN_PASSWORD") }}
        {{- fail "\n\nError: existing secret from existingSecret must set OTIV_DB_ADMIN_PASSWORD\n" }}
    {{- end }}
{{- end }}

{{- if .Values.global.secretlink.enabled }}
    {{/*
    Check for the type Validation
    */}}
    {{- if or (.Values.global.secretlink.vault.address) (.Values.global.secretlink.vault.mountpoint) (.Values.global.secretlink.vault.path) (.Values.global.secretlink.vault.namespace) (.Values.global.secretlink.vault.authpath) (.Values.global.secretlink.vault.role) }}
        {{- if or (not (kindIs "string" .Values.global.secretlink.vault.address)) (not (kindIs "string" .Values.global.secretlink.vault.mountpoint )) (not (kindIs "string" .Values.global.secretlink.vault.path)) (not (or (kindIs "string" .Values.global.secretlink.vault.namespace) (not (kindIs "string" .Values.global.secretlink.vault.namespace)))) (not (kindIs "string" .Values.global.secretlink.vault.authpath)) (not (or (kindIs "string" .Values.global.secretlink.vault.role) (not (kindIs "string" .Values.global.secretlink.vault.role)))) }}
            {{- fail "Please check that the following value need to set as string global.secretlink.vault.address, global.secretlink.vault.mountpoint, global.secretlink.vault.path, global.secretlink.vault.namespace, global.secretlink.vault.authpath, global.secretlink.vault.role" }}
        {{- end }}
    {{- end }}
	{{/*
    Validation of values when secretlink is enabled. It checks for all the secretlink values are not empty
	*/}}
	{{- if or (.Values.global.secretlink.vault.address | empty) (.Values.global.secretlink.vault.mountpoint | empty) (.Values.global.secretlink.vault.path | empty) (.Values.global.secretlink.vault.namespace | empty) (.Values.global.secretlink.vault.authpath | empty) (.Values.global.secretlink.vault.role | empty) }}
		{{- fail "global.secretlink.vault.address, global.secretlink.vault.mountpoint, global.secretlink.vault.path, global.secretlink.vault.namespace, global.secretlink.vault.authpath, global.secretlink.vault.role must be set since secretlink is enabled" }}
	{{- end }}
{{- end }}

{{- if .Values.global.otivSecretProviderClass.enabled }}
	{{- if (.Values.global.otivSecretProviderClass.objectName | empty) }}
        {{- if or (.Values.global.otivSecretProviderClass.dbObjectName | empty) (.Values.global.otivSecretProviderClass.otdsObjectName | empty) (.Values.global.otivSecretProviderClass.ivObjectName | empty) }}
            {{- fail "global.otivSecretProviderClass.dbObjectName, global.otivSecretProviderClass.otdsObjectName and global.otivSecretProviderClass.ivObjectName must all be set since global.otivSecretProviderClass is enabled, and global.otivSecretProviderClass.objectName is not set" }}
        {{- end }}
	{{- end }}
{{- end }}


