{{- define "pwc-project.name" -}}
{{- .Chart.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "pwc-project.fullname" -}}
{{- printf "%s" (include "pwc-project.name" .) | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "pwc-project.labels" -}}
app.kubernetes.io/name: {{ include "pwc-project.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}
