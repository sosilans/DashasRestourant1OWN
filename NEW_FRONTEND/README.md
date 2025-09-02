# НОВЫЙ ФРОНТЕНД - ГОТОВ К ПОДКЛЮЧЕНИЮ

## 🎯 Цель:
Подключить новый фронтенд шаблон к готовому бэкенд функционалу

## ✅ Что готово:
- **Laravel бэкенд** в `NEWDariasItalianKitchen4/ci-bootstrap/`
- **Деплой скрипты** работают
- **GitHub Actions** настроен
- **База данных** готова (reviews, menu, hours, site_blocks)
- **Админ панель** FilamentPHP готова

## 📁 Структура для нового фронтенда:
```
NEW_FRONTEND/
├── src/                    # Исходники нового шаблона
├── build/                  # Собранные файлы
├── package.json            # Зависимости
└── deploy-new-frontend.ps1 # Скрипт деплоя
```

## 🚀 Как подключить новый шаблон:

### Шаг 1: Разместите файлы
```
NEW_FRONTEND/
├── index.html
├── css/
├── js/
└── assets/
```

### Шаг 2: Запустите деплой
```powershell
.\deploy-new-frontend.ps1
```

## 🔌 API Endpoints (готовы к использованию):
- `GET /api/menu` - получить меню
- `GET /api/reviews` - получить отзывы  
- `GET /api/hours` - получить часы работы
- `POST /api/reviews` - добавить отзыв
- `GET /admin` - админ панель

## 🌐 Сервер:
- **IP:** 143.110.155.248
- **User:** master_znmnwmhwkc
- **Path:** ~/applications/ygrswjnpmw/public_html/

## 💡 Примечание:
Текущий сайт показывает заглушку "Coming Soon".
После размещения нового фронтенда - запустите деплой.
