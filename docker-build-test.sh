#!/bin/bash

echo "=== CI/CD Calculator - Docker Build e Test ==="

# Limpa containers e imagens antigas
echo "Limpando containers antigos..."
docker-compose down 2>/dev/null || true
docker rmi ci-cd-exercicio-calculator-api 2>/dev/null || true
docker rmi ci-cd-exercicio-calculator-test 2>/dev/null || true

# Build das imagens
echo "Construindo imagens Docker..."
docker-compose build

# Executa testes
echo "Executando testes no container..."
docker-compose run --rm calculator-test

if [ $? -eq 0 ]; then
    echo "✓ Testes passaram! Iniciando aplicação..."
    
    # Inicia aplicação
    docker-compose up -d calculator-api
    
    # Aguarda inicialização
    echo "Aguardando aplicação iniciar..."
    sleep 10
    
    # Executa testes de integração
    echo "Executando testes de integração..."
    ./test_container.sh
    
    echo ""
    echo "=== Aplicação rodando em http://localhost:5000 ==="
    echo "Para parar: docker-compose down"
    echo "Para ver logs: docker-compose logs -f"
    
else
    echo "✗ Testes falharam!"
    exit 1
fi
