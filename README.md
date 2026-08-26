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
This repository demonstrates an **Enterprise-Grade Infrastructure setup** for the official Spring Petclinic application. The project has been completely refactored from a standard development environment into a highly secure, optimized, and production-ready containerized architecture utilizing Docker best practices such as Multi-Stage Builds, Non-Root execution, and strict Dependency Management.

## 🏛️ 2. Architecture Diagram

<p align="center">
  <img src="docs/images/project-diagram.png" width="100%">
  <br>
  <em><b>Figure 1:</b> System Architecture Diagram </em>
</p>

## 🧰 3. Technology Stack
* **Application:** Java 17, Spring Boot
* **Containerization:** Docker, Multi-Stage Builds (Alpine Linux)
* **Orchestration (Local):** Docker Compose
* **Database:** MySQL 8.0
* **Security:** Non-Root User execution, Network Isolation

## 📂 4. Repository Structure
```text
.
├── Dockerfile                  # Multi-stage, secure container definition
├── docker-compose.yml          # Local orchestration & DB integration
├── .dockerignore               # Context size optimization
├── docs/                       # Project documentation assets
│   └── images/                 # Execution screenshots and architecture diagrams
│       ├── build-process.png
│       ├── project-diagram.png
│       ├── containers-healthy.png
│       ├── app-running.png
│       └── data-persistence.png
├── src/                        # Original Spring Petclinic Source Code
└── pom.xml                     # Maven build configuration
```
## 📋 5. Prerequisites
* [Docker Engine](https://docs.docker.com/engine/install/) (v20.10+)
* [Docker Compose](https://docs.docker.com/compose/install/) (v2.0+)
* Git


## ⚙️ 6. Step-by-Step Execution Guide

**1. Clone the repository:**
```bash
git clone [https://github.com/YOUR_GITHUB_USERNAME/spring-petclinic.git](https://github.com/YOUR_GITHUB_USERNAME/spring-petclinic.git)
cd spring-petclinic
```
2. Build and run the infrastructure:
```bash
docker-compose up -d --build
```
Build Process Preview:

3. Verify deployment health:
```bash
docker ps
```
Ensure both containers petclinic-web and petclinic-mysql show a (healthy) status.

4. Access the application:
Open your browser and navigate to: http://localhost:8080

## 🚀 7. Implementation Stages & Verification

### Stage 1: Multi-Stage Image Build & Optimization
Constructed the customized Spring Boot application image using an optimized multi-stage Dockerfile, significantly reducing the image footprint and securing the build process.
<p align="center">
  <img src="docs/images/build-process.png" width="90%">
  <br>
  <em><b>Figure 1:</b> Docker Compose build process showcasing layered caching and stage separation.</em>
</p>

### Stage 2: Local Orchestration & Container Health
Deployed the Spring Boot application and MySQL database using Docker Compose, implementing strict healthchecks to ensure correct startup sequencing and stable runtime.
<p align="center">
  <img src="docs/images/containers-healthy.png" width="90%">
  <br>
  <em><b>Figure 2:</b> Containers operating in an isolated network, both reaching a stable <code>(healthy)</code> state.</em>
</p>

### Stage 3: Application Routing Verification
Validated the successful exposure of the Spring Petclinic web interface on the designated host port, seamlessly communicating with the internal database network.
<p align="center">
  <img src="docs/images/app-running.png" width="90%">
  <br>
  <em><b>Figure 3:</b> The Spring Petclinic application successfully running and accessible via localhost.</em>
</p>

### Stage 4: Stateful Data Persistence
Verified that the Docker Volumes successfully retained critical application data (e.g., newly added pet owners) across complete container teardowns and restarts.
<p align="center">
  <img src="docs/images/data-persistence.png" width="90%">
  <br>
  <em><b>Figure 4:</b> Persistent data successfully retrieved from the MySQL volume after a simulated environment restart.</em>
</p>

## ⚠️ 8. Challenges Encountered & Solutions
* **Challenge:** Large image size and slow build times due to Maven dependencies and JDK inclusion.
  * **Solution:** Implemented **Multi-Stage Builds**. Stage 1 leverages Docker layer caching to download dependencies only once, while Stage 2 uses a minimal `jre-alpine` image, reducing the final footprint drastically.
* **Challenge:** Application container crashing on startup because the MySQL database wasn't fully initialized.
  * **Solution:** Configured comprehensive **Healthchecks** on the MySQL container and utilized `depends_on: condition: service_healthy` in Docker Compose to ensure a zero-crash, sequenced startup.
* **Challenge:** Security risks associated with running containers as root.
  * **Solution:** Created a dedicated `petclinic` user and group within the Alpine image to ensure the application runs with least-privilege permissions.

## 🔭 9. Future Enhancements
- [ ] Migrate orchestration to **Kubernetes** using custom Helm Charts.
- [ ] Implement Infrastructure as Code (IaC) provisioning with **Terraform / Ansible**.
- [ ] Integrate full observability stack (**Prometheus, Grafana, ELK Stack**).
- [ ] Establish automated CI/CD pipelines via GitHub Actions.

## 📬 10. Contact & Connect

<div align="center">
  <h3>🏗️ Architected & Deployed by</h3>
  <h2>Ahmed Mohamed Abbas Bahij</h2>
  <p><b>Cloud Infrastructure & DevOps Engineer</b></p>
  
  <a href="https://www.linkedin.com/in/ahmedabbas99" target="_blank">
    <img src="https://img.shields.io/badge/LinkedIn-Connect_Profile-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white" alt="LinkedIn Profile" />
  </a>
</div>
<hr>
