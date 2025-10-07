# Imagem base leve do Python
FROM python:3.10-slim

# Define o diretório de trabalho
WORKDIR /app

# Copia todos os arquivos do projeto
COPY . .

# Instala as dependências (usa cache mínimo para mais velocidade)
RUN pip install --no-cache-dir -r requirements.txt

# Expõe a porta que o Render usa por padrão
EXPOSE 5000

# Comando para rodar o app em produção
CMD ["gunicorn", "-b", "0.0.0.0:5000", "app:app"]
