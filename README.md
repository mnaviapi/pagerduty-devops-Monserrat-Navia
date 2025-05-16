pagerduty-devops-Monserrat-Navia

Este proyecto fue desarrollado como parte de una prueba técnica para el equipo de innovación de PagerDuty. Tiene como objetivo desplegar una infraestructura moderna, segura y escalable usando herramientas DevOps como Terraform, AWS y GitHub Actions.

---

Tecnologías utilizadas

- AWS: ECS (Fargate), RDS, Secrets Manager, IAM, VPC
- Terraform: Código modular reutilizable por ambiente
- GitHub Actions: Pipeline automatizado para despliegues
- Aplicación: Página simple HTML tipo “Hello, PagerDuty”
- Git: Flujo de ramas para separar ambientes

---

Objetivos del proyecto

1) Definir una arquitectura desacoplada para despliegue de contenedores
2) Usar infraestructura como código que sea fácil de replicar en distintos entornos (`dev` y `prod`)
3) Automatizar el pipeline de despliegue según la rama
4) Almacenar secretos de forma segura
5) Aplicar buenas prácticas como tagging, uso de módulos y separación de responsabilidades

---

Flujo de trabajo

- Cambios en la rama `develop` → despliegue al entorno de pruebas
- Cambios en la rama `main` → despliegue al entorno de producción

El pipeline incluye validación de Terraform, chequeo de formato, plan de cambios y aplicación automática.

---

Estructura del repositorio

```
terraform/
├── modules/
│ ├── vpc/
│ ├── ecs/
│ ├── rds/
│ ├── iam/
│ └── security/
├── envs/
│ ├── dev/
│ └── prod/

app/
.github/
diagrams/
README.md

```

---

Diagrama de arquitectura

El esquema completo de la infraestructura se encuentra en la carpeta `/diagrams`.

---

Tags

Todos los recursos están etiquetados con:
name = "csgtest"
environment = "dev" o "prod"


---

Licencia: Este proyecto está disponible bajo la licencia MIT.

---

# Alert Builder

This is a prototype application that allows you to manually create alert events in structured JSON format, as if they were incidents or technical issues.

## Features

- Build alerts manually via API
- Output in structured JSON
- Ready for integration with AWS ECS

## Endpoints (planned)

- `GET /alerts`
- `POST /alerts`

## Stack

- Node.js (Express)
- Terraform (for IaC deployment)
- Docker
- AWS ECS Fargate


