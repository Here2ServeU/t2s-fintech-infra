# Docker Applications

This directory contains two containerized applications used with the infrastructure project:

- `backend`: Flask application
- `frontend`: Node.js Express static site

## Maintainer Bio

Emmanuel Naweji

- Ph.D. Candidate, National University (in progress)
- Infrastructure, AI, DevOps, and Cloud Mentor

## Directory Layout

```text
docker/
|-- backend/
|   |-- app.py
|   |-- Dockerfile
|   |-- requirements.txt
|   |-- static/
|   `-- templates/
`-- frontend/
    |-- Dockerfile
    |-- package.json
    |-- server.js
    `-- public/
```

## Backend (Flask)

### Build

```bash
cd docker/backend
docker build -t t2s-backend:local .
```

### Run

```bash
docker run --rm -p 5050:5050 t2s-backend:local
```

App URL:

- `http://localhost:5050`

## Frontend (Express)

### Build

```bash
cd docker/frontend
docker build -t t2s-frontend:local .
```

### Run

```bash
docker run --rm -p 3000:3000 t2s-frontend:local
```

App URL:

- `http://localhost:3000`

## Local Development (Without Docker)

### Backend

```bash
cd docker/backend
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
python app.py
```

### Frontend

```bash
cd docker/frontend
npm install
npm start
```

## Deployment Notes

- Push container images to your target registry (for example ECR).
- Use immutable image tags for repeatable deployments.
- Keep runtime configuration outside images (environment variables or secret stores).
