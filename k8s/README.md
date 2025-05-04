# Kubernetes Deployment

This directory contains Kubernetes manifests for deploying the Spring Boot Docker Demo application.

## Directory Structure

```
k8s/
├── base/                    # Base Kubernetes manifests
│   ├── app.yaml            # Spring Boot application deployment
│   ├── configmap.yaml      # Application configuration
│   ├── postgres.yaml       # PostgreSQL deployment
│   ├── postgres-pvc.yaml   # PostgreSQL persistent volume claim
│   ├── secret.yaml         # Sensitive data
│   └── kustomization.yaml  # Kustomize configuration
├── overlays/               # Environment-specific configurations
│   ├── dev/               # Development environment
│   └── prod/              # Production environment
└── scripts/               # Deployment and maintenance scripts
```

## Prerequisites

- Kubernetes cluster (v1.19+)
- kubectl configured
- Docker images pushed to registry
- Ingress controller installed
- Storage class configured

## Deployment

### Base Deployment

```bash
kubectl apply -k k8s/base
```

### Development Environment

```bash
kubectl apply -k k8s/overlays/dev
```

### Production Environment

```bash
kubectl apply -k k8s/overlays/prod
```

## Components

1. **Spring Boot Application**
   - Deployment with 2 replicas
   - Resource limits and requests
   - Health checks
   - Service and Ingress

2. **PostgreSQL**
   - Stateful deployment
   - Persistent volume
   - Health checks
   - Internal service

3. **Configuration**
   - ConfigMap for application properties
   - Secrets for sensitive data
   - Environment-specific overlays

## Security

- Secrets for sensitive data
- Resource limits
- Health checks
- Network policies (to be implemented)

## Monitoring

- Actuator endpoints exposed
- Health checks configured
- Metrics available

## Maintenance

- Database backups (see scripts/)
- Log management
- Resource monitoring

## Next Steps

1. Implement network policies
2. Add monitoring stack
3. Configure backup solutions
4. Set up CI/CD pipelines 