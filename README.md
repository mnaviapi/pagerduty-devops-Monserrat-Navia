# 🚨 Alert Builder – Prueba Técnica DevOps (PagerDuty)

Este proyecto fue desarrollado por **Monserrat Navia** como parte de una prueba técnica para el equipo de innovación de **PagerDuty**. Su objetivo es diseñar, contenerizar y desplegar una aplicación prototipo en AWS Fargate, utilizando herramientas modernas de DevOps como Terraform, Docker, GitHub Actions y servicios de infraestructura de AWS.

---

## 🧰 Tecnologías Utilizadas

* **AWS**

  * ECS (Fargate)
  * ECR
  * VPC
  * IAM
  * Security Groups
* **Terraform** – Infraestructura como código, modular y reutilizable
* **Docker** – Contenerización de la aplicación `alert-builder`
* **GitHub Actions** *(planeado)* – CI/CD pipeline automatizado
* **Node.js + Express** – Aplicación backend para creación de alertas

---

## 🎯 Objetivos del Proyecto

* Construir una arquitectura desacoplada y segura para ejecutar contenedores en la nube
* Desplegar una aplicación en AWS ECS Fargate utilizando imágenes de Amazon ECR
* Gestionar infraestructura con Terraform, aplicando buenas prácticas modulares
* Asegurar separación entre ambientes (dev / prod)
* Automatizar despliegues con CI/CD
* Exponer la aplicación mediante una IP pública y puerto definido (3000)

---

## ⚙️ Flujo de Trabajo (GitOps CI/CD Planificado)

| Rama Git  | Entorno destino    |
| --------- | ------------------ |
| `develop` | Entorno de pruebas |
| `main`    | Producción         |

Cada commit ejecutará un pipeline que:

* Valida sintaxis y estilo con `terraform fmt` y `terraform validate`
* Ejecuta `terraform plan` y `terraform apply` en el entorno correspondiente
* Construye y sube la imagen a Amazon ECR
* Actualiza el servicio en ECS Fargate

---

## 📂 Estructura del Repositorio

```
terraform/
├── modules/
│   ├── vpc/
│   ├── ecs/
│   ├── rds/               # Opcional
│   ├── iam/
│   └── security/
├── envs/
│   ├── dev/
│   └── prod/

app/                       # Contiene la app Express "Alert Builder"
.github/                   # Workflows de CI/CD (pipeline)
diagrams/                  # Diagramas de arquitectura
README.md
```

---

## 📐 Arquitectura de Solución

El diagrama completo está en la carpeta [`/diagrams`](./diagrams/alert-builder.drawio).

**Componentes clave:**

* VPC personalizada con subredes públicas
* ECS Cluster con servicio en modo FARGATE
* Definición de tarea (`task definition`) con contenedor basado en imagen ECR
* Security Group que permite acceso al puerto TCP `3000`
* IP pública asignada automáticamente a la ENI de la tarea

---

## 🔔 Aplicación Alert Builder – Detalles Técnicos

Aplicación backend sencilla construida en **Node.js (Express)**, pensada para permitir la creación de alertas manuales con estructura JSON.

### Características

* Crear alertas simuladas vía API
* Retornar estructuras JSON como eventos técnicos
* Preparada para escalar horizontalmente

### Endpoints futuros (planeados)

```
GET  /alerts        # Obtener listado de alertas creadas
POST /alerts        # Crear nueva alerta manual
```

---

## 🚀 Resultado del Despliegue

La aplicación fue desplegada correctamente en AWS ECS Fargate y puede ser accedida desde una IP pública. Resultado esperado:

```bash
🟢 Alert Builder está corriendo 🚀
```

**URL de acceso (ejemplo real):**
[http://44.211.89.106:3000](http://44.211.89.106:3000)

---

## 🏷 Etiquetado de Recursos

Todos los recursos Terraform están etiquetados según ambiente y propósito para trazabilidad:

```hcl
name        = "alert-builder"
environment = "dev"  # o "prod"
managed-by  = "terraform"
```

---

## 🔐 Seguridad

* La aplicación corre dentro de una VPC privada
* Security Groups permiten tráfico únicamente al puerto 3000
* IAM roles limitados al principio de menor privilegio

## 🔎 Observabilidad y Logs

La definición de tarea incluye integración nativa con CloudWatch Logs, permitiendo trazabilidad completa de la app `alert-builder`.

- **Grupo de logs:** `/ecs/`
- **Stream de ejemplo:** `ecs/alert-builder/<task-id>`
- **Mensaje de arranque esperado:**  
  `Servidor escuchando en http://0.0.0.0:3000`

Esto permite visualizar y auditar en tiempo real el estado de la aplicación directamente desde la consola AWS o usando la CLI:

---

## 📜 Licencia

MIT License – Este proyecto está disponible para uso libre con fines educativos y técnicos.

---

## Autora

**Monserrat Navia**
DevOps & Cloud Engineering
[LinkedIn → monserratnavia](https://www.linkedin.com/in/monserratnavia)
Instagram técnico → `@monsenav.ai`
