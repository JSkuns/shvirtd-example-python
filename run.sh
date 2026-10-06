#!/bin/bash

echo "Остановка старых контейнеров (если есть)..."
docker compose down

echo "Сборка образов..."
docker compose build

echo "Запуск приложения..."
docker compose up -d

echo "✅ Готово! Приложение доступно по адресу: http://localhost:5000"
echo "Для просмотра логов используйте: docker compose logs -f web"
