# 🚨 Alert Builder – DevOps Technical Challenge (PagerDuty)

This project was developed by **Monserrat Navia** as part of a technical assessment for the **PagerDuty Innovation team**.  
Its goal is to design, containerize, and deploy a prototype application on **AWS Fargate**, using modern DevOps tools such as **Terraform**, **Docker**, **GitHub Actions**, and AWS infrastructure services.

---

## 🧰 Technologies Used

### AWS
- **ECS (Fargate)** – Container orchestration
- **ECR** – Container image registry
- **VPC** – Custom networking
- **IAM** – Access management
- **Security Groups** – Network-level security

### Tools
- **Terraform** – Infrastructure as code (modular and reusable)
- **Docker** – Containerization of the `alert-builder` app
- **GitHub Actions** *(planned)* – Automated CI/CD pipeline
- **Node.js + Express** – Backend application for creating alerts

---

## 🎯 Project Objectives

- Build a decoupled and secure architecture to run containers in the cloud  
- Deploy the application to AWS ECS Fargate using Amazon ECR images  
- Manage infrastructure with Terraform, following modular best practices  
- Ensure environment separation (dev / prod)  
- Automate deployments with CI/CD (pipeline planned)  
- Expose the application through a public IP and port 3000  

---

## ⚙️ GitOps Workflow (Planned CI/CD)

| Git Branch | Target Environment |
|------------|--------------------|
| `develop`  | Staging environment |
| `main`     | Production |

Each commit will trigger a pipeline that:

- Validates syntax and formatting via `terraform fmt` and `terraform validate`  
- Executes `terraform plan` and `terraform apply` for the corresponding environment  
- Builds and pushes the Docker image to Amazon ECR  
- Updates the ECS Fargate service with the new task definition  

---


## 📂 Repository Structure

terraform/
├── modules/
│ ├── vpc/
│ ├── ecs/
│ ├── rds/ # Optional
│ ├── iam/
│ └── security/
├── envs/
│ ├── dev/
│ └── prod/

app/ # Express app (Alert Builder)
.github/ # CI/CD GitHub workflows
diagrams/ # Architecture diagrams
README.md

---

## 📐 Solution Architecture

📄 Full diagram: 

[alert-builder.drawio.pdf](https://github.com/user-attachments/files/20280408/alert-builder.drawio.pdf)


**Key components:**

- Custom VPC with public subnets  
- ECS Cluster with service running in **Fargate** mode  
- Task definition based on a Docker image stored in ECR  
- Security Group allowing inbound traffic on TCP port 3000  
- Public IP automatically assigned to the task's ENI  

---

## 🔔 Alert Builder App – Technical Details

A simple backend app built with **Node.js (Express)** that allows creating mock alerts in JSON format.

### Features:
- Create simulated alerts via API  
- Return technical JSON-formatted payloads  
- Designed to scale horizontally  

### Future Endpoints *(planned)*:
- `GET  /alerts` – Retrieve list of created alerts  
- `POST /alerts` – Create a new manual alert  

---

## 🚀 Deployment Result

The application was successfully deployed on AWS ECS Fargate and is accessible via a public IP.

✅ Expected output:  
🟢 **Alert Builder is running**

**Example URL:**  
http://44.211.89.106:3000

---

## 🏷 Resource Tagging

All Terraform-managed resources are tagged for traceability based on environment and purpose:

hcl
name        = "alert-builder"
environment = "dev"   # or "prod"
managed-by  = "terraform"

🔐 Security
Application runs inside a private VPC

Security Groups only allow inbound traffic on port 3000

IAM roles follow the principle of least privilege

🔎 Observability and Logging
The ECS task definition integrates with CloudWatch Logs, enabling real-time traceability of the alert-builder app.

Log group: /ecs/
Example stream: ecs/alert-builder/<task-id>
Expected boot message:

nginx
Copiar
Editar
Server listening on http://0.0.0.0:3000
You can audit the application logs via the AWS Console or AWS CLI.

📜 License
MIT License – Free to use for educational and technical purposes.

🙋‍♀️ Author
Monserrat Navia
DevOps & Cloud Engineering
🔗 LinkedIn – Monserrat Navia
📸 Instagram – @monsenav.ai
