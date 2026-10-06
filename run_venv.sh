#!/bin/bash

echo "Удаление старого контейнера MySQL (если есть)..."
docker rm -f local_mysql 2>/dev/null || true

echo "Запуск MySQL в Docker..."
docker run --name local_mysql \
  -e MYSQL_ROOT_PASSWORD=root \
  -e MYSQL_DATABASE=example \
  -e MYSQL_USER=app \
  -e MYSQL_PASSWORD=very_strong \
  -p 3306:3306 \
  -d mysql:8.0

echo "Ожидание инициализации MySQL (20 секунд)..."
sleep 20

echo "Активация виртуального окружения..."
source venv/bin/activate

echo "Запуск приложения через uvicorn..."
uvicorn main:app --host 0.0.0.0 --port 5000
