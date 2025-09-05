# CI/CD Exercício

Este projeto implementa exercícios práticos completos de CI/CD, demonstrando conceitos de Integração Contínua (CI) e Entrega Contínua (CD) utilizando Git, GitHub Actions e Docker.

## Estrutura do Projeto

```
ci-cd-exercicio/
├── src/
│   ├── app.py              # Funções principais (soma, multiplica, subtrai, divide)
│   └── test_app.py         # Testes unitários das funções
├── .github/
│   └── workflows/
│       ├── ci.yml          # Pipeline CI/CD básico
│       └── docker.yml      # Pipeline Docker completo
├── flask_app.py            # API REST Flask
├── test_flask_app.py       # Testes da API Flask
├── Dockerfile              # Imagem Docker de produção
├── Dockerfile.test         # Imagem Docker para testes
├── docker-compose.yml      # Orquestração para desenvolvimento
├── build.sh               # Script de build (Linux/Mac)
├── build.ps1              # Script de build (Windows)
├── requirements.txt       # Dependências Python
├── DOCKER.md              # Documentação Docker detalhada
└── README.md              # Esta documentação
```

## Exercícios Implementados

### Exercício 1: Configuração de CI Básica
- Repositório GitHub criado
- Aplicação Python com funções matemáticas
- Testes unitários com pytest
- Pipeline básico de CI configurado
- Demonstração de falha e correção de pipeline

### Exercício 2: Integração de Linter
- Linter flake8 integrado ao pipeline
- Código ajustado aos padrões do flake8
- Pipeline atualizado para incluir verificação de estilo
- Demonstração de falha e correção do linter

### Exercício 3: Deploy Simples (CD)
- Script de build para empacotamento
- Pipeline CD configurado para criar releases
- Upload automático de artefatos no GitHub Releases
- Correção: Atualização para actions modernas com permissões adequadas

### Exercício 4: Pull Requests
- Branch feature/nova-funcao criado
- Novas funções implementadas (subtrai, divide)
- Testes correspondentes implementados
- Fluxo de pull request demonstrado

### Exercício 5: Pipeline Docker (NOVO)
- Aplicação Flask com API REST
- Dockerfile otimizado para produção
- Pipeline Docker com build, test e push para Docker Hub
- Testes automatizados em containers
- Deploy multi-arquitetura (amd64/arm64)
- Health checks e monitoramento

## Pipelines CI/CD

### Pipeline Básico (ci.yml)
O pipeline básico executa em dois cenários:

**Para Pull Requests:**
1. Checkout do código
2. Setup do Python 3.9
3. Instalação das dependências
4. Linter com flake8
5. Testes com pytest
6. Build do artefato

**Para Push na Main:**
Executa todos os passos acima, mais:
7. Criação de release automático
8. Upload do artefato projeto.zip

### Pipeline Docker (docker.yml)
O pipeline Docker é mais avançado e inclui:

**Test Stage:**
- Testes unitários Python
- Linter (flake8)
- Testes da API Flask

**Docker Test Stage:**
- Build da imagem de teste
- Execução de todos os testes em container

**Build and Push Stage:**
- Login no Docker Hub
- Build multi-arquitetura
- Push com tags (latest, SHA)
- Teste da imagem publicada
- Criação de release com informações da imagem

## API REST

A aplicação Flask expõe uma API REST com os seguintes endpoints:

| Endpoint | Método | Descrição |
|----------|--------|-----------|
| `/` | GET | Documentação da API |
| `/health` | GET | Health check |
| `/soma/<a>/<b>` | GET | Soma dois números |
| `/multiplica/<a>/<b>` | GET | Multiplica dois números |
| `/subtrai/<a>/<b>` | GET | Subtrai dois números |
| `/divide/<a>/<b>` | GET | Divide dois números |

## Como Usar

### Desenvolvimento Local

**Python tradicional:**
```bash
# Instalar dependências
pip install -r requirements.txt

# Executar testes
pytest src/test_app.py -v
pytest test_flask_app.py -v

# Executar API
python flask_app.py
```

**Com Docker:**
```bash
# Build e execução completa
docker-compose up --build

# Apenas testes
docker-compose run --rm calculator-test

# Apenas API
docker-compose up calculator-api
```

**Imagem publicada no Docker Hub:**
```bash
# Pull e execução da imagem publicada
docker pull gabrieldorodrigues/ci-cd-calculator:latest
docker run -p 5000:5000 gabrieldorodrigues/ci-cd-calculator:latest
```

### Testes

**Testes unitários:**
```bash
pytest src/test_app.py -v
```

**Testes da API:**
```bash
pytest test_flask_app.py -v
```

**Testes em Docker:**
```bash
docker build -f Dockerfile.test -t calculator:test .
docker run --rm calculator:test
```

## Funcionalidades

### Funções Matemáticas
- `soma(a, b)`: Retorna a + b
- `multiplica(a, b)`: Retorna a * b
- `subtrai(a, b)`: Retorna a - b
- `divide(a, b)`: Retorna a / b (com tratamento de divisão por zero)

### Pipeline Features
- Testes automatizados
- Verificação de qualidade (linter)
- Build automatizado
- Deploy automático via releases
- Suporte a pull requests
- Containerização com Docker
- Publicação no Docker Hub
- Testes em containers
- Multi-arquitetura (amd64/arm64)

## Configuração de Secrets

Para usar a pipeline Docker, configure os seguintes secrets no GitHub:

```
DOCKER_USERNAME=seu_usuario_dockerhub
DOCKER_PASSWORD=sua_senha_ou_token_dockerhub
```

## Demonstrações Realizadas

### Falha Intencional e Correção
1. Erro na função soma: `return a + b + 1` (corrigido)
2. Erro de linter: Falta de nova linha no final (corrigido)
3. Teste que falha: Demonstrado e corrigido

### Fluxo de Pull Request
1. Branch feature/nova-funcao criado
2. Novas funções implementadas
3. Testes adicionados
4. Pipeline executado no PR
5. Pronto para merge

### Pipeline Docker
1. Build automatizado de imagens
2. Testes executados em containers
3. Publicação no Docker Hub
4. Verificação da imagem publicada
5. Release com informações da imagem

## Links Importantes

- **Repositório**: https://github.com/gabrieldorodrigues/ci-cd-exercicio
- **Docker Hub**: https://hub.docker.com/r/gabrieldorodrigues/ci-cd-calculator
- **Documentação Docker**: [DOCKER.md](./DOCKER.md)

## Próximos Passos

Para expandir este projeto, considere:
- Adicionar cobertura de testes
- Containerização com Docker (FEITO)
- Deploy em ambiente cloud
- Testes de segurança
- Notificações automáticas
- Environments de staging/production
- Kubernetes deployment
- Monitoring e observabilidade

## Troubleshooting

### Erro "Resource not accessible by integration"
Problema: Erro ao criar releases com actions antigas
Solução: Implementada
- Atualizado para `softprops/action-gh-release@v1`
- Adicionadas permissões `contents: write`
- Migrado de actions deprecated

### Problemas de Permissões no GitHub Actions
```yaml
permissions:
  contents: write # Para criar releases
  packages: write # Para publicar packages
```

### Pipeline não executa em PRs
- Verificar se o branch está configurado corretamente
- Confirmar que o arquivo está em `.github/workflows/`
- Validar sintaxe YAML

## Recursos Úteis

- [Documentação GitHub Actions](https://docs.github.com/en/actions)
- [Tutorial Pytest](https://docs.pytest.org/en/stable/)
- [Guia Flake8](https://flake8.pycqa.org/en/latest/)
- [Git Flow](https://www.atlassian.com/git/tutorials/comparing-workflows/gitflow-workflow)
- [softprops/action-gh-release](https://github.com/softprops/action-gh-release)
- [Docker Hub](https://hub.docker.com/)
- [Flask Documentation](https://flask.palletsprojects.com/)

## Licença

Este projeto está licenciado sob a MIT License.

---

Status: Todos os exercícios implementados, testados e dockerizados
