{{- define "cluster_role_rules" }}
{{- range  $index,$val := .Values.cluster_role_rules }}
- apiGroups: {{ $val.apiGroups }}
  resources: {{ $val.resources }}
  verbs: {{ $val.verbs }}
{{- end }}
{{- end }}

{{- define "cluster_role_subjects" }}
{{- range  $index,$val := .Values.cluster_role_binding.subjects }}
- apiGroup: {{ $val.apiGroup }}
  name: {{ $val.name }}
  kind: {{ $val.kind }}
{{- end }}
{{- end }}

{{- define "aws_auth_map_users" }}
mapUsers: |- 
{{- range  $index,$val := .Values.aws_auth_users }}
  - userarn: {{ $val.userarn }}
    username: {{ $val.username }}
    groups: {{ $val.groups }}
{{- end }}
{{- end }}
