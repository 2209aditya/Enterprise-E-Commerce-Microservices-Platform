# 🛒 Enterprise E-Commerce Microservices Platform

[![Azure](https://img.shields.io/badge/Azure-AKS-0078D4?logo=microsoftazure)](https://azure.microsoft.com/)
[![Kubernetes](https://img.shields.io/badge/Kubernetes-1.28+-326CE5?logo=kubernetes)](https://kubernetes.io/)
[![Terraform](https://img.shields.io/badge/Terraform-IaC-7B42BC?logo=terraform)](https://www.terraform.io/)
[![ArgoCD](https://img.shields.io/badge/ArgoCD-GitOps-EF7B4D?logo=argo)](https://argoproj.github.io/cd/)
[![Helm](https://img.shields.io/badge/Helm-Charts-0F1689?logo=helm)](https://helm.sh/)

> Production-grade microservices architecture deployed on Azure Kubernetes Service (AKS) with Angular frontend, Spring Boot backend, complete security hardening, GitOps automation, and enterprise DevOps practices.

## 📋 Table of Contents

- [Architecture Overview](#-architecture-overview)
- [Technology Stack](#-technology-stack)
- [Features](#-features)
- [Security Implementation](#-security-implementation)
- [Repository Structure](#-repository-structure)
- [Prerequisites](#-prerequisites)
- [Quick Start](#-quick-start)
- [Deployment Guide](#-deployment-guide)
- [GitOps with ArgoCD](#-gitops-with-argocd)
- [Monitoring & Observability](#-monitoring--observability)
- [CI/CD Pipeline](#-cicd-pipeline)
- [Contributing](#-contributing)
- [License](#-license)

## 🏗️ Architecture Overview

```
Internet
   ↓
Azure Front Door (WAF, CDN)
   ↓
Application Gateway (WAF v2)
   ↓
NGINX Ingress Controller
   ↓
┌─────────────────────────────────────────────────┐
│           Azure Kubernetes Service (AKS)        │
│                                                  │
│  ┌──────────────┐      ┌──────────────────────┐│
│  │   Angular    │      │   API Gateway        ││
│  │   Frontend   │◄────►│  (Spring Cloud)      ││
│  └──────────────┘      └──────────────────────┘│
│                               ↓                  │
│        ┌──────────────────────┴─────────────┐  │
│        ↓          ↓          ↓        ↓      ↓  │
│   ┌────────┐ ┌────────┐ ┌──────┐ ┌──────┐ ┌───┐│
│   │ Auth   │ │ User   │ │ Cart │ │Order │ │Pay││
│   │Service │ │Service │ │Svc   │ │Svc   │ │Svc││
│   └────────┘ └────────┘ └──────┘ └──────┘ └───┘│
│                                                  │
│   ┌────────────────┐    ┌──────────────────┐   │
│   │ Redis Cache    │    │ Azure Service    │   │
│   │                │    │ Bus              │   │
│   └────────────────┘    └──────────────────┘   │
└─────────────────────────────────────────────────┘
           ↓                      ↓
    ┌─────────────┐        ┌──────────────┐
    │ Azure SQL   │        │ Azure Key    │
    │ Cosmos DB   │        │ Vault        │
    └─────────────┘        └──────────────┘
```

## 🛠️ Technology Stack

### Infrastructure & Orchestration
- **Cloud Platform**: Azure
- **Container Orchestration**: Azure Kubernetes Service (AKS)
- **IaC**: Terraform
- **GitOps**: ArgoCD
- **Package Manager**: Helm 3
- **Service Mesh**: Istio (Optional)

### Application Stack
- **Frontend**: Angular 16+, TypeScript, RxJS
- **Backend**: Java 17, Spring Boot 3.x
- **API Gateway**: Spring Cloud Gateway
- **Authentication**: OAuth2, JWT, Azure AD
- **Caching**: Redis
- **Message Queue**: Azure Service Bus
- **Databases**: Azure SQL, Cosmos DB

### Security & Compliance
- **WAF**: Azure Front Door + Application Gateway
- **Secrets**: Azure Key Vault + CSI Driver
- **Image Scanning**: Trivy, Snyk
- **Policy Enforcement**: OPA Gatekeeper
- **Network Security**: Azure CNI, Network Policies
- **SAST/DAST**: SonarQube, OWASP ZAP

### Observability
- **Monitoring**: Prometheus, Azure Monitor
- **Logging**: ELK Stack / Azure Log Analytics
- **Tracing**: Jaeger, Azure Application Insights
- **Dashboards**: Grafana

## ✨ Features

### Application Features
- ✅ User authentication & authorization (OAuth2/JWT)
- ✅ Product catalog management
- ✅ Shopping cart functionality
- ✅ Order processing & management
- ✅ Payment integration (mock/real)
- ✅ Real-time inventory updates
- ✅ Responsive Angular SPA

### DevOps Features
- ✅ Infrastructure as Code (Terraform)
- ✅ GitOps-based deployments (ArgoCD)
- ✅ Automated CI/CD pipelines
- ✅ Helm chart templating
- ✅ Multi-environment support (dev/staging/prod)
- ✅ Horizontal Pod Autoscaling (HPA)
- ✅ Rolling updates & rollback
- ✅ Blue-green deployments

### Enterprise Features
- ✅ Zero-trust network architecture
- ✅ Secrets management via Key Vault
- ✅ Private AKS cluster
- ✅ Azure WAF protection
- ✅ Rate limiting & throttling
- ✅ SSL/TLS termination
- ✅ Distributed tracing
- ✅ Centralized logging

## 🔐 Security Implementation

### Infrastructure Security
- **Private AKS Cluster**: No public API server endpoint
- **Azure CNI**: VNET-integrated networking
- **NSGs & UDRs**: Network traffic control
- **Azure WAF**: Layer 7 protection
- **Private Endpoints**: Secure DB & Key Vault access
- **Managed Identity**: Passwordless authentication

### Kubernetes Security
- **RBAC**: Role-based access control
- **Network Policies**: Zero-trust pod communication
- **Pod Security Standards**: Restricted workload isolation
- **Secrets CSI Driver**: Azure Key Vault integration
- **Image Scanning**: Vulnerability detection pre-deployment
- **Admission Control**: OPA Gatekeeper policies

### Application Security
- **OAuth2 & JWT**: Industry-standard authentication
- **Spring Security**: Framework-level protection
- **Rate Limiting**: DDoS mitigation
- **HTTPS Only**: TLS 1.3 encryption
- **Input Validation**: XSS/SQL injection prevention
- **OWASP Top 10**: Comprehensive coverage
- **Dependency Scanning**: Regular CVE checks

## 📁 Repository Structure

```
ecommerce-microservices-azure/
│
├── terraform/                    # Infrastructure as Code
│   ├── backend.tf               # Remote state configuration
│   ├── providers.tf             # Azure provider setup
│   ├── variables.tf             # Input variables
│   ├── main.tf                  # Main resource group
│   ├── vnet.tf                  # Virtual network setup
│   ├── aks.tf                   # AKS cluster configuration
│   ├── acr.tf                   # Container registry
│   ├── keyvault.tf              # Key Vault setup
│   ├── servicebus.tf            # Azure Service Bus
│   ├── sql.tf                   # Azure SQL configuration
│   └── outputs.tf               # Output values
│
├── k8s/                         # Raw Kubernetes manifests
│   ├── namespaces.yaml
│   ├── ingress.yaml
│   ├── network-policy.yaml
│   ├── secrets-csi.yaml
│   └── services/
│       ├── api-gateway.yaml
│       ├── auth-service.yaml
│       └── ...
│
├── helm/                        # Helm charts
│   ├── frontend/               # Angular frontend chart
│   │   ├── Chart.yaml
│   │   ├── values.yaml
│   │   └── templates/
│   │       ├── deployment.yaml
│   │       ├── service.yaml
│   │       └── ingress.yaml
│   │
│   └── microservice/           # Reusable microservice chart
│       ├── Chart.yaml
│       ├── values.yaml
│       └── templates/
│           ├── deployment.yaml
│           ├── service.yaml
│           ├── hpa.yaml
│           ├── configmap.yaml
│           └── serviceaccount.yaml
│
├── argocd/                      # ArgoCD GitOps
│   ├── projects/
│   │   └── ecommerce-project.yaml
│   └── applications/
│       ├── frontend-app.yaml
│       ├── api-gateway-app.yaml
│       ├── auth-service-app.yaml
│       ├── product-service-app.yaml
│       ├── cart-service-app.yaml
│       └── order-service-app.yaml
│
├── environments/                # Environment-specific values
│   ├── dev/
│   │   ├── frontend-values.yaml
│   │   ├── product-values.yaml
│   │   └── ...
│   ├── staging/
│   └── prod/
│
├── docker/                      # Dockerfiles
│   ├── angular.Dockerfile
│   ├── springboot.Dockerfile
│   └── .dockerignore
│
├── scripts/                     # Automation scripts
│   ├── setup-aks.sh
│   ├── install-argocd.sh
│   ├── deploy-services.sh
│   └── generate-secrets.sh
│
├── .github/                     # GitHub Actions
│   └── workflows/
│       ├── terraform-plan.yaml
│       ├── build-frontend.yaml
│       └── build-backend.yaml
│
├── docs/                        # Documentation
│   ├── architecture.md
│   ├── deployment.md
│   ├── security.md
│   └── troubleshooting.md
│
├── .gitignore
├── LICENSE
└── README.md
```

## 📋 Prerequisites

Before you begin, ensure you have the following installed:

- **Azure CLI** (v2.50+): `az --version`
- **kubectl** (v1.28+): `kubectl version`
- **Terraform** (v1.5+): `terraform --version`
- **Helm** (v3.12+): `helm version`
- **ArgoCD CLI** (v2.8+): `argocd version`
- **Docker** (v24+): `docker --version`
- **Git**: `git --version`

### Azure Requirements
- Active Azure subscription
- Contributor or Owner role on subscription
- Azure AD tenant (for OAuth2)
- Service Principal or Managed Identity

## 🚀 Quick Start

### 1. Clone the Repository

```bash
git clone https://github.com/your-username/ecommerce-microservices-azure.git
cd ecommerce-microservices-azure
```

### 2. Setup Azure Authentication

```bash
az login
az account set --subscription "YOUR_SUBSCRIPTION_ID"
```

### 3. Deploy Infrastructure with Terraform

```bash
cd terraform

# Initialize Terraform
terraform init

# Review the plan
terraform plan -out=tfplan

# Apply the configuration
terraform apply tfplan
```

### 4. Configure kubectl

```bash
az aks get-credentials --resource-group ecom-rg --name ecom-aks
kubectl get nodes
```

### 5. Install ArgoCD

```bash
cd ../scripts
./install-argocd.sh

# Get admin password
kubectl -n argocd get secret argocd-initial-admin-secret \
  -o jsonpath="{.data.password}" | base64 -d
```

### 6. Deploy Applications

```bash
# Apply ArgoCD applications
kubectl apply -f ../argocd/projects/
kubectl apply -f ../argocd/applications/

# Watch deployments
argocd app list
argocd app sync frontend
```

## 📦 Deployment Guide

### Manual Deployment (Helm)

```bash
# Deploy frontend
helm upgrade --install frontend ./helm/frontend \
  -f ./environments/prod/frontend-values.yaml \
  --namespace ecommerce --create-namespace

# Deploy product service
helm upgrade --install product-service ./helm/microservice \
  -f ./environments/prod/product-values.yaml \
  --namespace ecommerce
```

### GitOps Deployment (ArgoCD)

1. **Fork this repository**
2. **Update ArgoCD application manifests** with your repo URL
3. **Apply ArgoCD applications**:
   ```bash
   kubectl apply -f argocd/applications/
   ```
4. **Sync applications**:
   ```bash
   argocd app sync --all
   ```

### Environment Promotion

```bash
# Dev → Staging
git tag -a staging-v1.0.0 -m "Release v1.0.0 to staging"
git push origin staging-v1.0.0

# Staging → Prod
git tag -a prod-v1.0.0 -m "Release v1.0.0 to production"
git push origin prod-v1.0.0
```

## 🔄 GitOps with ArgoCD

### Architecture

```
Git Repository (Source of Truth)
        ↓
    ArgoCD (Continuous Sync)
        ↓
    Kubernetes Cluster
```

### Application Sync Policies

- **Auto-sync**: Enabled for dev environment
- **Self-healing**: Automatic correction of drift
- **Prune**: Remove resources deleted from Git
- **Manual approval**: Required for production

### Rollback Strategy

```bash
# List application history
argocd app history product-service

# Rollback to previous version
argocd app rollback product-service <revision-id>
```

## 📊 Monitoring & Observability

### Prometheus Metrics
- Custom business metrics
- JVM metrics (heap, threads, GC)
- HTTP request rates and latencies
- Pod CPU/memory usage

### Grafana Dashboards
- Cluster overview
- Application performance
- Business KPIs
- Alert management

### Logging
```bash
# View logs
kubectl logs -f deployment/product-service -n ecommerce

# Search logs (if using ELK)
# Navigate to Kibana and use KQL queries
```

### Tracing
- Distributed tracing with Jaeger
- Request flow visualization
- Performance bottleneck identification

## 🔧 CI/CD Pipeline

### Build Pipeline (GitHub Actions)

```yaml
# .github/workflows/build-backend.yaml
- Checkout code
- Run unit tests
- SonarQube analysis
- Build Docker image
- Scan with Trivy
- Push to ACR
- Update Helm values in GitOps repo
```

### Deployment Pipeline (ArgoCD)

```
Git Commit → ArgoCD Detects Change → Sync Application → Deploy to K8s
```

## 🧪 Testing

### Local Testing

```bash
# Frontend
cd frontend-angular
npm install
npm test
npm run e2e

# Backend
cd product-service
./mvnw clean test
./mvnw verify
```

### Integration Testing

```bash
# Deploy to dev environment
kubectl apply -k k8s/overlays/dev/

# Run integration tests
./scripts/run-integration-tests.sh
```

## 🛡️ Security Best Practices

1. **Never commit secrets** - Use Azure Key Vault
2. **Scan images regularly** - Integrate Trivy in CI/CD
3. **Implement RBAC** - Principle of least privilege
4. **Enable network policies** - Zero-trust networking
5. **Regular updates** - Keep dependencies current
6. **Audit logs** - Enable Azure Activity Log
7. **Backup regularly** - Velero for disaster recovery

## 🤝 Contributing

Contributions are welcome! Please follow these guidelines:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

### Code Standards
- Follow Java Spring Boot best practices
- Use Angular style guide
- Write comprehensive tests (>80% coverage)
- Document all public APIs
- Run linters before committing

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- Azure AKS team for excellent documentation
- ArgoCD community for GitOps best practices
- Spring Boot community for microservices patterns
- CNCF for Kubernetes and cloud-native tools

## 📞 Support

- **Issues**: [GitHub Issues](https://github.com/your-username/ecommerce-microservices-azure/issues)
- **Discussions**: [GitHub Discussions](https://github.com/your-username/ecommerce-microservices-azure/discussions)
- **Email**: your-email@example.com

## 🗺️ Roadmap

- [ ] Multi-region deployment
- [ ] Service mesh integration (Istio)
- [ ] Advanced observability (OpenTelemetry)
- [ ] Chaos engineering (Chaos Mesh)
- [ ] Cost optimization dashboards
- [ ] Automated disaster recovery
- [ ] GraphQL API gateway
- [ ] Event-driven architecture patterns

---

⭐ **Star this repository** if you find it helpful!

**Built with ❤️ for the DevOps community**
