import pytest
import json
from flask_app import app


@pytest.fixture
def client():
    app.config['TESTING'] = True
    with app.test_client() as client:
        yield client


def test_home(client):
    """Testa a rota home"""
    response = client.get('/')
    assert response.status_code == 200
    data = json.loads(response.data)
    assert data['message'] == 'CI/CD Calculator API'
    assert 'endpoints' in data


def test_health(client):
    """Testa a rota de health check"""
    response = client.get('/health')
    assert response.status_code == 200
    data = json.loads(response.data)
    assert data['status'] == 'healthy'
    assert data['service'] == 'calculator-api'


def test_api_soma(client):
    """Testa a API de soma"""
    response = client.get('/soma/2/3')
    assert response.status_code == 200
    data = json.loads(response.data)
    assert data['operation'] == 'sum'
    assert data['a'] == 2
    assert data['b'] == 3
    assert data['result'] == 5


def test_api_multiplica(client):
    """Testa a API de multiplicação"""
    response = client.get('/multiplica/4/5')
    assert response.status_code == 200
    data = json.loads(response.data)
    assert data['operation'] == 'multiply'
    assert data['result'] == 20


def test_api_subtrai(client):
    """Testa a API de subtração"""
    response = client.get('/subtrai/10/3')
    assert response.status_code == 200
    data = json.loads(response.data)
    assert data['operation'] == 'subtract'
    assert data['result'] == 7


def test_api_divide(client):
    """Testa a API de divisão"""
    response = client.get('/divide/10/2')
    assert response.status_code == 200
    data = json.loads(response.data)
    assert data['operation'] == 'divide'
    assert data['result'] == 5.0


def test_api_divide_by_zero(client):
    """Testa divisão por zero"""
    response = client.get('/divide/10/0')
    assert response.status_code == 400
    data = json.loads(response.data)
    assert 'error' in data
