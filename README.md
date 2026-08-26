<div align="center">

# 🚀 Enterprise Spring Petclinic Infrastructure

![Docker](https://img.shields.io/badge/DOCKER-CONTAINERIZED-2496ED?style=for-the-badge&logo=docker&logoColor=white)
![Spring Boot](https://img.shields.io/badge/SPRING_BOOT-FRAMEWORK-6DB33F?style=for-the-badge&logo=spring&logoColor=white)
![MySQL](https://img.shields.io/badge/MYSQL-DATABASE-4479A1?style=for-the-badge&logo=mysql&logoColor=white)
![Java](https://img.shields.io/badge/JAVA_17-ECLIPSE_TEMURIN-ED8B00?style=for-the-badge&logo=openjdk&logoColor=white)
<br>
![Build](https://img.shields.io/badge/INFRASTRUCTURE-PRODUCTION_READY-brightgreen?style=for-the-badge)

</div>

---

## 📖 1. Project Overview
This repository demonstrates an **Enterprise-Grade Infrastructure setup** for the official Spring Petclinic application. The project has evolved from optimized local Docker containerization into a highly available, production-ready **Kubernetes (K8s)** architecture, complete with persistent storage, zero-trust network isolation, and domain-based Ingress routing.

## 🏛️ 2. Architecture Diagram

<p align="center">
  <img src="docs/images/project-diagram.png" width="100%">
  <br>
  <em><b>Figure 1:</b> System Architecture Diagram </em>
</p>

## 🧰 3. Technology Stack
* **Application:** Java 17, Spring Boot
* **Containerization:** Docker, Multi-Stage Builds (Alpine Linux)
* **Local Orchestration:** Docker Compose
* **Enterprise Orchestration:** Kubernetes (K8s)
* **Database:** MySQL 8.0 (StatefulSets, PV/PVCs for Data Persistence)
* **Networking & Routing:** NGINX Ingress Controller, K8s Services
* **Security:** Non-Root User execution, K8s Zero-Trust Network Policies

## 📂 4. Repository Structure
```text
.
├── deploy/                     # Infrastructure deployment manifests
│   └── k8s/                    # Kubernetes configuration files
│       ├── 01-mysql-storage.yaml    # PV & PVC configurations
│       ├── 02-mysql.yaml            # StatefulSet & ClusterIP Service
│       ├── 03-app.yaml              # Deployment & NodePort Service
│       ├── 04-network-policy.yaml   # Zero-Trust Database Isolation
│       └── 05-ingress.yaml          # NGINX Ingress Controller setup
├── docs/                       # Project documentation assets
│   └── images/                 # Execution screenshots and diagrams
│       ├── 2a-compute-resources.png
│       ├── 2b-storage-resources.png
│       ├── 4-ingress-routing.png
│       ├── app-running.png
│       ├── app-running-k8s.png
│       ├── build-process.png
│       ├── containers-healthy.png
│       ├── data-persistence.png
│       ├── docker push.png
│       ├── dockerhub-images.png
│       └── project-diagram.png
├── src/                        # Original Spring Petclinic Source Code
├── Dockerfile                  # Multi-stage, secure container definition
├── docker-compose.yml          # Local orchestration & DB integration
<<<<<<< HEAD
├── pom.xml                     # Maven build configuration
└── .dockerignore               # Context size optimization

```
## 📋 5. Prerequisites
To fully deploy and test this infrastructure, ensure you have the following installed:
* [Git](https://git-scm.com/downloads)
* [Docker Engine](https://docs.docker.com/engine/install/) & [Docker Compose](https://docs.docker.com/compose/install/) (For local testing)
* **A running Kubernetes Cluster** (e.g., `kubeadm`, `minikube`, or cloud-managed like EKS/AKS)
* [`kubectl` CLI](https://kubernetes.io/docs/tasks/tools/) configured to communicate with your cluster
* **NGINX Ingress Controller** installed on your K8s cluster

## 🐳 6. Local Execution Guide (Docker Compose)
*Use this method for local development and testing.*

**1. Clone the repository:**
```bash
git clone [https://github.com/YOUR_GITHUB_USERNAME/spring-petclinic.git](https://github.com/YOUR_GITHUB_USERNAME/spring-petclinic.git)
cd spring-petclinic
```
2. Build and run the infrastructure:
```bash
docker-compose up -d --build
```

3. Verify deployment health:
```bash
docker ps
```
Ensure both containers petclinic-web and petclinic-mysql show a (healthy) status.

4. Access the application:
Open your browser and navigate to: http://localhost:8080

☸️ 7. Enterprise Deployment Guide (Kubernetes)
Use this method to deploy the highly available, production-ready cluster.

1. Apply the storage configurations (PV & PVC):
```bash
kubectl apply -f deploy/k8s/01-mysql-storage.yaml
```
2. Deploy the database and application workloads:
```bash
kubectl apply -f deploy/k8s/02-mysql.yaml
kubectl apply -f deploy/k8s/03-app.yaml
```
3. Apply Network Policies and Ingress routing:
```bash
kubectl apply -f deploy/k8s/04-network-policy.yaml
kubectl apply -f deploy/k8s/05-ingress.yaml
```
4. Configure local DNS resolution:
Add the following line to your /etc/hosts file (Linux/Mac) or C:\Windows\System32\drivers\etc\hosts (Windows) to resolve the custom Ingress domain:
# Replace the IP with your actual Kubernetes Node IP
192.168.92.129  petclinic.local
5. Verify cluster health:
```bash
kubectl get pods,svc,ingress
```
Ensure all pods are Running and the Ingress controller has successfully mapped the host.

6. Access the application:
Open your browser and navigate to the assigned Ingress NodePort: http://petclinic.local:31359

## 🚀 8. Implementation Stages & Verification

### 🐳 Part A: Docker Containerization Phase

#### Stage 1: Multi-Stage Image Build & Optimization
Constructed the customized Spring Boot application image using an optimized multi-stage Dockerfile, significantly reducing the image footprint and securing the build process.
<p align="center">
  <img src="docs/images/build-process.png" width="90%">
  <br>
  <em><b>Figure 2:</b> Docker Compose build process showcasing layered caching and stage separation.</em>
</p>

#### Stage 2: Local Orchestration & Container Health
Deployed the Spring Boot application and MySQL database using Docker Compose, implementing strict healthchecks to ensure correct startup sequencing and stable runtime.
<p align="center">
  <img src="docs/images/containers-healthy.png" width="90%">
  <br>
  <em><b>Figure 3:</b> Containers operating in an isolated network, both reaching a stable <code>(healthy)</code> state.</em>
</p>

#### Stage 3: Application Routing Verification
Validated the successful exposure of the Spring Petclinic web interface on the designated host port, seamlessly communicating with the internal database network.
<p align="center">
  <img src="docs/images/app-running.png" width="90%">
  <br>
  <em><b>Figure 4:</b> The Spring Petclinic application successfully running and accessible via localhost.</em>
</p>

#### Stage 4: Stateful Data Persistence
Verified that the Docker Volumes successfully retained critical application data (e.g., newly added pet owners) across complete container teardowns and restarts.
<p align="center">
  <img src="docs/images/data-persistence.png" width="90%">
  <br>
  <em><b>Figure 5:</b> Persistent data successfully retrieved from the MySQL volume after a simulated environment restart.</em>
</p>

---

### ☸️ Part B: Kubernetes Enterprise Deployment Phase

#### Stage 1: Private Registry (DockerHub) Integration
Pushed the customized container images to a secure DockerHub repository to be pulled securely by the cluster.
<p align="center">
  <img src="docs/images/dockerhub-images.png" width="90%">
  <br>
  <em><b>Figure 6:</b> DockerHub repository securely storing the application and database images.</em>
</p>

#### Stage 2: Compute Resources Deployment
Deployed the Spring application via Deployments (High Availability with 2 Replicas) and the MySQL database via StatefulSets.
<p align="center">
  <img src="docs/images/2a-compute-resources_2.png" width="90%">
  <br>
  <em><b>Figure 7:</b> Pods, Deployments, and StatefulSets in a stable `Running` state without restart loops.</em>
</p>

#### Stage 3: Dynamic Storage Provisioning
Verified that the Persistent Volume Claims (PVCs) for the database successfully bound to the provisioned Persistent Volumes (PVs).
<p align="center">
  <img src="docs/images/2b-storage-resources.png" width="90%">
  <br>
  <em><b>Figure 8:</b> PVCs and PVs successfully Bound to isolated host directories.</em>
</p>

#### Stage 4: Network Isolation & Routing Setup
Validated the creation of internal Services, applied strict Network Policies for database isolation, and configured the NGINX Ingress controller for domain routing.
<p align="center">
  <img src="docs/images/4-ingress-routing.png" width="90%">
  <br>
  <em><b>Figure 9:</b> Application successfully accessed via NGINX Ingress routing using a custom local domain.</em>
</p>

## ⚠️ 9. Challenges Encountered & Solutions
* **Challenge:** Large image size and slow build times during initial containerization.
  * **Solution:** Implemented **Multi-Stage Builds** using Alpine Linux, leveraging layer caching to download dependencies only once and reducing the final footprint drastically.
* **Challenge:** Guaranteeing database data persistence across ephemeral Kubernetes Pod restarts.
  * **Solution:** Transitioned from Deployments to **StatefulSets** for the MySQL database and implemented **Persistent Volumes (PV) & PVCs** mapped to isolated host directories.
* **Challenge:** Securely routing external traffic to the application while completely isolating the database from public access.
  * **Solution:** Utilized an **NGINX Ingress Controller** for clean domain-based routing (`petclinic.local`) and applied strict **Zero-Trust Network Policies** that restrict database access exclusively to the application pods.

## 🔭 10. Future Enhancements
- [x] Migrate local orchestration to an **Enterprise Kubernetes Cluster**.
- [ ] Package Kubernetes manifests using **Helm Charts** for dynamic and template-based deployments.
- [ ] Implement Infrastructure as Code (IaC) provisioning pipelines with **Terraform & Ansible**.
- [ ] Integrate a full observability and telemetry stack (**Prometheus, Grafana, ELK Stack**).
- [ ] Establish automated CI/CD pipelines via **GitHub Actions**.

## 📬 11. Contact & Connect

<div align="center">
  <h3>🏗️ Architected & Deployed by</h3>
  <h2>Ahmed Mohamed Abbas Bahij</h2>
  <p><b>Cloud Infrastructure & DevOps Engineer</b></p>
  
  <a href="https://www.linkedin.com/in/ahmedabbas99" target="_blank">
    <img src="https://img.shields.io/badge/LinkedIn-Connect_Profile-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white" alt="LinkedIn Profile" />
  </a>
</div>
<hr>
