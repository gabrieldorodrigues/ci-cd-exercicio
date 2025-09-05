# Use Python oficial como imagem base
FROM python:3.9-slim

# Define o diretório de trabalho no container
WORKDIR /app

# Copia arquivos de requirements primeiro (para cache de layers)
COPY requirements.txt .

# Instala dependências Python
RUN pip install --no-cache-dir -r requirements.txt

# Copia o código da aplicação
COPY src/ ./src/
COPY flask_app.py .

# Exposição da porta que a aplicação vai usar
EXPOSE 5000

# Define variáveis de ambiente
ENV FLASK_APP=flask_app.py
ENV FLASK_ENV=production

# Comando para executar a aplicação
CMD ["python", "flask_app.py"]
