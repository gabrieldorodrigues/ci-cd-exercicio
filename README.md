# CI/CD Exercício

Este projeto tem como objetivo ensinar os conceitos básicos de Integração Contínua (CI) e Entrega Contínua (CD) utilizando ferramentas modernas como Git, GitHub e GitHub Actions.

## Estrutura do Projeto

```
ci-cd-exercicio
├── src
│   ├── app.py          # Contém a função soma(a, b)
│   └── test_app.py     # Contém os testes para a função soma
├── .github
│   └── workflows
│       └── ci.yml      # Define o pipeline de CI usando GitHub Actions
├── build.sh            # Script para empacotar o projeto
├── requirements.txt     # Lista de dependências do projeto
└── README.md           # Documentação do projeto
```

## Pré-requisitos

- Conta no GitHub
- Conhecimento básico de Git (clone, commit, push)
- Python 3.x instalado localmente
- Editor de texto (VS Code, PyCharm ou similar)
- Familiaridade com comandos de terminal

## Instalação

1. Clone o repositório:
   ```
   git clone <URL_DO_REPOSITORIO>
   cd ci-cd-exercicio
   ```

2. Instale as dependências:
   ```
   pip install -r requirements.txt
   ```

## Uso

- Para executar os testes, utilize o comando:
  ```
  pytest src/test_app.py
  ```

- Para rodar o linter, utilize o comando:
  ```
  flake8 src/app.py
  ```

- Para empacotar o projeto, execute o script:
  ```
  ./build.sh
  ```

## Contribuição

Sinta-se à vontade para contribuir com melhorias ou correções. Crie um fork do repositório, faça suas alterações e envie um pull request.

## Licença

Este projeto está licenciado sob a MIT License.