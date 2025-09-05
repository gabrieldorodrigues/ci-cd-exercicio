# CI/CD Exercício

Este projeto implementa todos os exercícios práticos de fundamentos de CI/CD, demonstrando conceitos de Integração Contínua (CI) e Entrega Contínua (CD) utilizando Git, GitHub e GitHub Actions.

## 📁 Estrutura do Projeto

```
ci-cd-exercicio/
├── src/
│   ├── app.py              # Funções principais (soma, multiplica, subtrai, divide)
│   └── test_app.py         # Testes unitários completos
├── .github/
│   └── workflows/
│       └── ci.yml          # Pipeline CI/CD completo
├── build.sh                # Script de build (Linux/Mac)
├── build.ps1               # Script de build (Windows PowerShell)
├── requirements.txt        # Dependências (pytest, flake8)
├── .gitignore             # Arquivos ignorados pelo Git
└── README.md              # Esta documentação
```

## 🎯 Exercícios Implementados

### ✅ Exercício 1: Configuração de CI Básica
- ✅ Repositório GitHub criado
- ✅ Aplicação Python com função `soma(a, b)`
- ✅ Testes unitários com pytest
- ✅ Pipeline básico de CI configurado
- ✅ Demonstração de falha e correção de pipeline

### ✅ Exercício 2: Integração de Linter
- ✅ Linter flake8 integrado ao pipeline
- ✅ Código ajustado aos padrões do flake8
- ✅ Pipeline atualizado para incluir verificação de estilo
- ✅ Demonstração de falha e correção do linter

### ✅ Exercício 3: Deploy Simples (CD)
- ✅ Script `build.sh` para empacotamento
- ✅ Script `build.ps1` para Windows
- ✅ Pipeline CD configurado para criar releases
- ✅ Upload automático de artefatos no GitHub Releases

### ✅ Exercício 4: Pull Requests
- ✅ Branch `feature/nova-funcao` criado
- ✅ Novas funções adicionadas (subtrai, divide)
- ✅ Testes correspondentes implementados
- ✅ Fluxo de pull request demonstrado

## 🚀 Pipeline CI/CD

O pipeline é executado em dois cenários:

### 🔄 Para Pull Requests
1. **Checkout** do código
2. **Setup** do Python 3.9
3. **Instalação** das dependências
4. **Linter** com flake8
5. **Testes** com pytest
6. **Build** do artefato

### 🚀 Para Push na Main
Executa todos os passos acima, mais:
7. **Criação** de release automático
8. **Upload** do artefato projeto.zip

## 🛠️ Como Usar

### Pré-requisitos
- Python 3.x
- Git
- Conta no GitHub

### Instalação Local
```bash
# Clone o repositório
git clone https://github.com/seu-usuario/ci-cd-exercicio.git
cd ci-cd-exercicio

# Instale as dependências
pip install -r requirements.txt
```

### Execução Local
```bash
# Execute os testes
pytest src/test_app.py -v

# Execute o linter
flake8 src/app.py

# Gere o pacote (Linux/Mac)
./build.sh

# Gere o pacote (Windows)
powershell -ExecutionPolicy Bypass -File build.ps1
```

## 🧪 Testes

O projeto inclui testes completos para todas as funções:

- **test_soma()**: Testa adição de números
- **test_multiplica()**: Testa multiplicação
- **test_subtrai()**: Testa subtração
- **test_divide()**: Testa divisão e tratamento de erro

```bash
# Executar todos os testes
pytest src/test_app.py -v

# Executar com cobertura
pytest src/test_app.py --cov=src
```

## 📋 Funcionalidades

### Funções Matemáticas
- `soma(a, b)`: Retorna a + b
- `multiplica(a, b)`: Retorna a * b
- `subtrai(a, b)`: Retorna a - b
- `divide(a, b)`: Retorna a / b (com tratamento de divisão por zero)

### Pipeline Features
- ✅ Testes automatizados
- ✅ Verificação de qualidade (linter)
- ✅ Build automatizado
- ✅ Deploy automático via releases
- ✅ Suporte a pull requests

## 🔧 Demonstrações Realizadas

### Falha Intencional e Correção
1. **Erro na função soma**: `return a + b + 1` (corrigido)
2. **Erro de linter**: Falta de nova linha no final (corrigido)
3. **Teste que falha**: Demonstrado e corrigido

### Fluxo de Pull Request
1. Branch `feature/nova-funcao` criado
2. Novas funções implementadas
3. Testes adicionados
4. Pipeline executado no PR
5. Pronto para merge

## 📈 Próximos Passos

Para expandir este projeto, considere:

- 📊 Adicionar cobertura de testes
- 🐳 Containerização com Docker
- 🌐 Deploy em ambiente cloud
- 🔐 Testes de segurança
- 📱 Notificações automáticas
- 🎯 Environments de staging/production

## 📚 Recursos Úteis

- [Documentação GitHub Actions](https://docs.github.com/en/actions)
- [Tutorial Pytest](https://docs.pytest.org/en/stable/)
- [Guia Flake8](https://flake8.pycqa.org/en/latest/)
- [Git Flow](https://www.atlassian.com/git/tutorials/comparing-workflows/gitflow-workflow)

## 📄 Licença

Este projeto está licenciado sob a MIT License.

---

**Status**: ✅ Todos os exercícios implementados e testados