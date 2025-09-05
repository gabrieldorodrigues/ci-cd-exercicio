# Docker CI/CD Pipeline

Esta seção demonstra a implementação de uma pipeline Docker completa que constrói, testa e publica uma imagem Docker no Docker Hub.

## Arquitetura da Solução

### Aplicação Flask

- **API REST** com endpoints para operações matemáticas
- **Health check** para monitoramento
- **Tratamento de erros** adequado
- **Testes unitários** completos

### Docker

- **Dockerfile** otimizado para produção
- **Dockerfile.test** para execução de testes
- **Multi-stage build** (implícito)
- **Docker Compose** para desenvolvimento local

### Pipeline CI/CD

- **Testes locais** (Python + pytest)
- **Testes em container** (Docker)
- **Build e push** para Docker Hub
- **Teste da imagem** publicada
- **Release automático** com informações da imagem

## Estrutura dos Arquivos

```
├── flask_app.py              # Aplicação Flask principal
├── test_flask_app.py         # Testes da API Flask
├── Dockerfile                # Imagem de produção
├── Dockerfile.test           # Imagem para testes
├── docker-compose.yml        # Orquestração local
├── test_container.sh         # Script de teste Linux/Mac
├── test_container.ps1        # Script de teste Windows
├── docker-build-test.sh      # Build e teste automatizado
└── .github/workflows/docker.yml  # Pipeline GitHub Actions
```

## Endpoints da API

| Endpoint              | Método | Descrição               | Exemplo                                     |
| --------------------- | ------ | ----------------------- | ------------------------------------------- |
| `/`                   | GET    | Documentação da API     | `curl http://localhost:5000/`               |
| `/health`             | GET    | Health check            | `curl http://localhost:5000/health`         |
| `/soma/<a>/<b>`       | GET    | Soma dois números       | `curl http://localhost:5000/soma/2/3`       |
| `/multiplica/<a>/<b>` | GET    | Multiplica dois números | `curl http://localhost:5000/multiplica/4/5` |
| `/subtrai/<a>/<b>`    | GET    | Subtrai dois números    | `curl http://localhost:5000/subtrai/10/3`   |
| `/divide/<a>/<b>`     | GET    | Divide dois números     | `curl http://localhost:5000/divide/10/2`    |

## Como Usar

### Desenvolvimento Local

1. **Com Docker Compose (Recomendado)**:

```bash
# Build e inicia todos os serviços
docker-compose up --build

# Apenas testes
docker-compose run --rm calculator-test

# Apenas aplicação
docker-compose up calculator-api
```

2. **Build manual**:

```bash
# Build da imagem
docker build -t ci-cd-calculator .

# Executa aplicação
docker run -p 5000:5000 ci-cd-calculator

# Executa testes
docker build -f Dockerfile.test -t ci-cd-calculator:test .
docker run --rm ci-cd-calculator:test
```

3. **Script automatizado**:

```bash
# Linux/Mac
chmod +x docker-build-test.sh
./docker-build-test.sh

# Windows
powershell -ExecutionPolicy Bypass -File docker-build-test.ps1
```

### Produção (Docker Hub)

```bash
# Pull da imagem publicada
docker pull gabrieldorodrigues/ci-cd-calculator:latest

# Executa em produção
docker run -d -p 5000:5000 --name calculator-api gabrieldorodrigues/ci-cd-calculator:latest

# Testa se está funcionando
curl http://localhost:5000/health
```

## Pipeline Stages

### 1. Test Stage

- Testes unitários Python
- Linter (flake8)
- Testes da API Flask

### 2. Docker Test Stage

- Build da imagem de teste
- Execução de todos os testes em container

### 3. Build and Push Stage

- Login no Docker Hub
- Build multi-architecture (amd64, arm64)
- Push com tags (latest, SHA)
- Teste da imagem publicada
- Criação de release com informações

## Configuração de Secrets

Para que a pipeline funcione, configure os seguintes secrets no GitHub:

```
DOCKER_USERNAME=seu_usuario_dockerhub
DOCKER_PASSWORD=sua_senha_ou_token_dockerhub
```

## Exemplos de Uso da API

### Teste básico

```bash
# Health check
curl http://localhost:5000/health

# Resposta esperada:
# {"status": "healthy", "service": "calculator-api"}
```

### Operações matemáticas

```bash
# Soma
curl http://localhost:5000/soma/2/3
# {"operation": "sum", "a": 2, "b": 3, "result": 5}

# Multiplicação
curl http://localhost:5000/multiplica/4/5
# {"operation": "multiply", "a": 4, "b": 5, "result": 20}

# Divisão
curl http://localhost:5000/divide/10/2
# {"operation": "divide", "a": 10, "b": 2, "result": 5.0}

# Divisão por zero (erro)
curl http://localhost:5000/divide/10/0
# {"error": "Não é possível dividir por zero"}
```

## Monitoramento

### Logs do Container

```bash
# Docker Compose
docker-compose logs -f calculator-api

# Docker direto
docker logs -f calculator-api
```

### Health Check

```bash
# Verificação manual
curl -f http://localhost:5000/health || echo "Serviço indisponível"

# Com Docker
docker run --rm curlimages/curl curl -f http://host.docker.internal:5000/health
```

## Troubleshooting

### Container não inicia

```bash
# Verifica logs
docker logs container-name

# Verifica se porta está ocupada
netstat -an | grep 5000
```

### Testes falham

```bash
# Executa testes isoladamente
docker run --rm -it ci-cd-calculator:test /bin/bash
pytest -v
```

### Problemas de conectividade

```bash
# Verifica se container está rodando
docker ps

# Testa conectividade interna
docker exec -it container-name curl localhost:5000/health
```

---

Esta implementação demonstra as melhores práticas de:

- Containerização de aplicações Python/Flask
- Pipelines CI/CD com Docker
- Testes automatizados em containers
- Publicação em registros de imagem
- Automação completa do deploy
