0. Prerrequisitos
Antes de empezar, asegúrate de tener:

Un cluster EKS funcionando
kubectl configurado contra EKS
Shellaws eks update-kubeconfig --region eu-west-1 --name <NOMBRE_CLUSTER>Show more lines

Un Ingress Controller (ALB Controller o NGINX) si quieres acceso HTTP
(Opcional) Storage persistente (EBS o EFS)


1. Crear Namespace (opcional pero recomendado)
YAMLapiVersion: v1kind: Namespacemetadata:  name: pgadminShow more lines
Shellkubectl apply -f namespace.yamlShow more lines

2. Crear un Secret con las credenciales de pgAdmin
pgAdmin4 necesita al menos:

Email de login
Password

YAMLapiVersion: v1kind: Secretmetadata:  name: pgadmin-secret  namespace: pgadmintype: OpaquestringData:  PGADMIN_DEFAULT_EMAIL: admin@example.com  PGADMIN_DEFAULT_PASSWORD: SuperPassword123Show more lines
Shellkubectl apply -f pgadmin-secret.yaml``Show more lines
🔐 Nunca pongas credenciales directamente en el Deployment

3. Crear PersistentVolumeClaim (opcional pero MUY recomendado)
Para no perder configuraciones y servidores registrados.
Ejemplo con EBS (StorageClass por defecto):
YAMLapiVersion: v1kind: PersistentVolumeClaimmetadata:  name: pgadmin-pvc  namespace: pgadminspec:  accessModes:    - ReadWriteOnce  resources:    requests:      storage: 5GiShow more lines
Shellkubectl apply -f pgadmin-pvc.yamlShow more lines
📌 pgAdmin usa /var/lib/pgadmin para datos persistentes.

4. Deployment de pgAdmin4
Imagen oficial:
dpage/pgadmin4

Deployment básico
YAMLapiVersion: apps/v1kind: Deploymentmetadata:  name: pgadmin  namespace: pgadminspec:  replicas: 1  selector:    matchLabels:      app: pgadmin  template:    metadata:      labels:        app: pgadmin    spec:      containers:      - name: pgadmin        image: dpage/pgadmin4:latest        ports:          - containerPort: 80        envFrom:          - secretRef:              name: pgadmin-secret        env:          - name: PGADMIN_CONFIG_SERVER_MODE            value: "True"        volumeMounts:          - name: pgadmin-data            mountPath: /var/lib/pgadmin      volumes:        - name: pgadmin-data          persistentVolumeClaim:            claimName: pgadmin-pvcShow more lines
Shellkubectl apply -f pgadmin-deployment.yamlShow more lines

5. Service (ClusterIP)
YAMLapiVersion: v1kind: Servicemetadata:  name: pgadmin  namespace: pgadminspec:  selector:    app: pgadmin  ports:    - protocol: TCP      port: 80      targetPort: 80  type: ClusterIPShow more lines
YAMLkubectl apply -f pgadmin-service.yamlShow more lines

6. Ingress (opcional pero típico en EKS)
Ejemplo con AWS Load Balancer Controller (ALB)
YAMLapiVersion: networking.k8s.io/v1kind: Ingressmetadata:  name: pgadmin-ingress  namespace: pgadmin  annotations:    kubernetes.io/ingress.class: alb    alb.ingress.kubernetes.io/scheme: internet-facing    alb.ingress.kubernetes.io/target-type: ipspec:  rules:    - host: pgadmin.midominio.com      http:        paths:          - path: /            pathType: Prefix            backend:              service:                name: pgadmin                port:                  number: 80Show more lines
Shellkubectl apply -f pgadmin-ingress.yamlShow more lines
✅ Apunta el DNS (pgadmin.midominio.com) al ALB creado.

7. Verificación
Shellkubectl get pods -n pgadminkubectl get svc -n pgadminkubectl get ingress -n pgadminShow more lines
Logs:
Shellkubectl logs deploy/pgadmin -n pgadminShow more lines
Accede vía navegador e inicia sesión con el email/password del Secret.

8. Conectar pgAdmin a RDS / PostgreSQL
Desde la UI de pgAdmin:

Host: endpoint del RDS o Service interno
Port: 5432
Username / Password
✅ Si usas RDS privado → asegúrate de:

Security Groups permiten tráfico desde el nodo EKS
Subnets compatibles




9. Buenas prácticas recomendadas
✅ Usa EFS si necesitas HA (varios pods)
✅ Limita recursos:
YAMLresources:  requests:    cpu: "100m"    memory: "256Mi"  limits:    cpu: "500m"    memory: "512Mi"Show more lines
✅ Protege acceso con:

Authentication del Ingress
IP whitelisting
VPN / Private ALB


10. Arquitectura típica
Internet
   ↓
ALB (Ingress)
   ↓
Service (ClusterIP)
   ↓
pgAdmin Pod
   ↓
PostgreSQL / RDS

