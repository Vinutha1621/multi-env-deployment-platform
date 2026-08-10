# Multi-Environment Deployment Platform

## 📌 Overview

This project implements a multi-environment DevOps deployment platform for deploying a containerized web application across isolated **Development, Staging, and Production environments** on AWS.

The infrastructure is provisioned using **Terraform**, the application is containerized using **Docker**, workloads are deployed on **Amazon EKS**, images are stored in **Amazon ECR**, and application delivery is automated using **GitHub Actions CI/CD**.

The project demonstrates practical implementation of:

- Infrastructure as Code
- AWS cloud infrastructure
- Containerization
- Kubernetes orchestration
- Container image management
- Multi-environment deployments
- CI/CD automation
- Deployment validation
- Kubernetes troubleshooting

---

# 🏗️ Architecture

The overall architecture follows this deployment flow:

```text
                         Developer
                             |
                             | Git Push
                             v
                      GitHub Repository
                             |
              +--------------+--------------+
              |              |              |
           develop        staging          main
              |              |              |
              v              v              v
       Development CI/CD  Staging CI/CD  Production CI/CD
              |              |              |
              +--------------+--------------+
                             |
                             v
                       GitHub Actions
                             |
                        Docker Build
                             |
                             v
                        Amazon ECR
                             |
                     Git SHA Image Tag
                             |
                             v
                        Amazon EKS
                             |
          +------------------+------------------+
          |                  |                  |
          v                  v                  v
     development         staging           production
      namespace          namespace          namespace
          |                  |                  |
          +------------------+------------------+
                             |
                             v
                    Kubernetes Service
                             |
                             v
                        Application
