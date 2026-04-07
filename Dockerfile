FROM python:3.11-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY gsc_server.py .

# Credentials injected at runtime via Cloud Run secret mounts
ENV GSC_CREDENTIALS_PATH=/secrets/service_account_credentials.json
ENV GSC_OAUTH_CLIENT_SECRETS_FILE=/secrets2/client_secrets.json

CMD ["python", "gsc_server.py"]
