# Script PowerShell para testar aplicação Flask no Docker

Write-Host "=== Testando aplicação Flask no Docker ===" -ForegroundColor Green

function Test-Endpoint {
    param(
        [string]$Url,
        [int]$ExpectedStatus
    )
    
    Write-Host "Testando: $Url" -ForegroundColor Yellow
    
    try {
        $response = Invoke-WebRequest -Uri $Url -UseBasicParsing -ErrorAction Stop
        $statusCode = $response.StatusCode
        
        if ($statusCode -eq $ExpectedStatus) {
            Write-Host "✓ Status: $statusCode (esperado: $ExpectedStatus)" -ForegroundColor Green
            Write-Host "  Resposta: $($response.Content)" -ForegroundColor Gray
        } else {
            Write-Host "✗ Status: $statusCode (esperado: $ExpectedStatus)" -ForegroundColor Red
            return $false
        }
    }
    catch {
        $statusCode = $_.Exception.Response.StatusCode.value__
        if ($statusCode -eq $ExpectedStatus) {
            Write-Host "✓ Status: $statusCode (esperado: $ExpectedStatus)" -ForegroundColor Green
        } else {
            Write-Host "✗ Erro: $($_.Exception.Message)" -ForegroundColor Red
            return $false
        }
    }
    
    Write-Host ""
    return $true
}

# Aguarda o container iniciar
Write-Host "Aguardando aplicação iniciar..." -ForegroundColor Cyan
Start-Sleep -Seconds 5

# Testa endpoints
Write-Host "Iniciando testes dos endpoints..." -ForegroundColor Cyan

Test-Endpoint "http://localhost:5000/" 200
Test-Endpoint "http://localhost:5000/health" 200
Test-Endpoint "http://localhost:5000/soma/2/3" 200
Test-Endpoint "http://localhost:5000/multiplica/4/5" 200
Test-Endpoint "http://localhost:5000/subtrai/10/3" 200
Test-Endpoint "http://localhost:5000/divide/10/2" 200
Test-Endpoint "http://localhost:5000/divide/10/0" 400

Write-Host "=== Testes concluídos ===" -ForegroundColor Green
