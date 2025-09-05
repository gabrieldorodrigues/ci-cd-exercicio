from app import soma, multiplica, subtrai, divide
import pytest


def test_soma():
    assert soma(2, 3) == 5
    assert soma(-1, 1) == 0
    assert soma(0, 0) == 0


def test_multiplica():
    assert multiplica(2, 3) == 6
    assert multiplica(-1, 1) == -1
    assert multiplica(0, 5) == 0
    assert multiplica(4, 0) == 0


def test_subtrai():
    assert subtrai(5, 3) == 2
    assert subtrai(1, 1) == 0
    assert subtrai(0, 5) == -5


def test_divide():
    assert divide(6, 2) == 3
    assert divide(5, 2) == 2.5
    assert divide(-10, 2) == -5
    
    # Testa divisão por zero
    with pytest.raises(ValueError, match="Não é possível dividir por zero"):
        divide(10, 0)