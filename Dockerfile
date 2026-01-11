FROM python:3.10-slim

WORKDIR /app

# Dependências do sistema necessárias para pandas/numpy
RUN apt-get update && apt-get install -y \
    gcc \
    build-essential \
    python3-dev \
    && rm -rf /var/lib/apt/lists/*

# Instala Poetry
RUN pip install --no-cache-dir poetry

# Copia os arquivos de dependência
COPY pyproject.toml poetry.lock ./

# Configura Poetry para usar o próprio container como ambiente
RUN poetry config virtualenvs.create false

# Instala dependências do projeto
RUN poetry install --no-interaction --no-ansi --no-root

# Copia o restante do projeto
COPY . .

EXPOSE 8888

CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--allow-root", "--no-browser"]
