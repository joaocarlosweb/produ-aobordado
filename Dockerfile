# Base oficial do Python 3.12 (compatível com pandas 2.2.2)
FROM python:3.12-slim

# Define diretório de trabalho
WORKDIR /app

# Copia dependências
COPY requirements.txt .

# Instala dependências
RUN pip install --no-cache-dir -r requirements.txt

# Copia o restante dos arquivos do projeto
COPY . .

# Expõe a porta padrão do Render (ou Flask)
EXPOSE 10000

# Comando para rodar o app com Gunicorn (necessário pro Render)
CMD ["gunicorn", "app:app"]
