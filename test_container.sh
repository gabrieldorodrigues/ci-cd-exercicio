#!/bin/bash

echo "=== Testando aplicação Flask no Docker ==="

# Função para testar endpoint
test_endpoint() {
    local url=$1
    local expected_status=$2
    echo "Testando: $url"
    
    response=$(curl -s -w "%{http_code}" -o /tmp/response.json "$url")
    status_code="${response: -3}"
    
    if [ "$status_code" = "$expected_status" ]; then
        echo "✓ Status: $status_code (esperado: $expected_status)"
        if [ -f /tmp/response.json ]; then
            echo "  Resposta: $(cat /tmp/response.json)"
        fi
    else
        echo "✗ Status: $status_code (esperado: $expected_status)"
        return 1
    fi
    echo ""
}

# Aguarda o container iniciar
echo "Aguardando aplicação iniciar..."
sleep 5

# Testa endpoints
echo "Iniciando testes dos endpoints..."

test_endpoint "http://localhost:5000/" "200"
test_endpoint "http://localhost:5000/health" "200"
test_endpoint "http://localhost:5000/soma/2/3" "200"
test_endpoint "http://localhost:5000/multiplica/4/5" "200"
test_endpoint "http://localhost:5000/subtrai/10/3" "200"
test_endpoint "http://localhost:5000/divide/10/2" "200"
test_endpoint "http://localhost:5000/divide/10/0" "400"

echo "=== Testes concluídos ==="
