# Start from official Python image
FROM python:3.11-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Set working directory
WORKDIR /price_tracker

# Install system dependencies
RUN apt-get update \
    && apt-get install -y build-essential libpq-dev curl \
    && rm -rf /var/lib/apt/lists/*

# Install Poetry (optional: comment out if using requirements.txt instead)
# RUN curl -sSL https://install.python-poetry.org | python3 -
# ENV PATH="/root/.local/bin:$PATH"

# Install Python dependencies
COPY requirements.txt .
RUN pip install --upgrade pip \
    && pip install -r requirements.txt

# Copy project files
COPY . .

# Default command (overridden by docker-compose per service)
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
