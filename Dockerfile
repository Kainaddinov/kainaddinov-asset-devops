FROM python:3.12-alpine

WORKDIR /app

COPY app/ /app/

RUN python --version && mkdir -p /app/data

ENV PYTHONUNBUFFERED=1

EXPOSE 8080

CMD ["python", "app.py"]
