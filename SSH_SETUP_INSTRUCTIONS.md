# 🔐 SSH Key Setup Instructions

## Проблема Device Login Loop

**Причина:** GitHub Actions использует пароль для SSH подключения, что вызывает device login loop в headless CI среде.

**Решение:** Заменить пароль на SSH ключи.

## Шаги настройки

### 1. Генерация SSH ключей (локально)

```bash
# Создать SSH ключ для деплоя
ssh-keygen -t ed25519 -C "deploy@cloudways" -f ~/.ssh/cloudways_deploy_key

# Показать публичный ключ
cat ~/.ssh/cloudways_deploy_key.pub
```

### 2. Добавить публичный ключ в GitHub

1. Перейти в GitHub → Settings → Deploy keys
2. Нажать "Add deploy key"
3. Вставить содержимое `~/.ssh/cloudways_deploy_key.pub`
4. Назвать ключ: "Cloudways Deploy Key"
5. ✅ Отметить "Allow write access" (если нужно)
6. Нажать "Add key"

### 3. Добавить приватный ключ в GitHub Secrets

1. Перейти в GitHub → Settings → Secrets and variables → Actions
2. Нажать "New repository secret"
3. Имя: `CLOUDWAYS_SSH_KEY`
4. Значение: содержимое `~/.ssh/cloudways_deploy_key` (приватный ключ)
5. Нажать "Add secret"

### 4. Добавить публичный ключ на Cloudways сервер

```bash
# Подключиться к серверу
ssh master_znmnwmhwkc@143.110.155.248

# Добавить публичный ключ в authorized_keys
echo "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAI..." >> ~/.ssh/authorized_keys

# Установить правильные права
chmod 600 ~/.ssh/authorized_keys
chmod 700 ~/.ssh
```

### 5. Тестирование подключения

```bash
# Тест SSH подключения
ssh -i ~/.ssh/cloudways_deploy_key master_znmnwmhwkc@143.110.155.248

# Если работает, вы увидите приглашение сервера
```

## Текущие GitHub Secrets

Убедитесь, что у вас есть эти secrets:

- `CLOUDWAYS_SSH_HOST`: `143.110.155.248`
- `CLOUDWAYS_SSH_USER`: `master_znmnwmhwkc`
- `CLOUDWAYS_SSH_KEY`: (приватный SSH ключ)

## Удаление старых secrets

После настройки SSH ключей можно удалить:
- `CLOUDWAYS_SSH_PASS` (пароль больше не нужен)

## Проверка работы

1. Сделать commit и push в main ветку
2. Проверить GitHub Actions → Deploy to Cloudways
3. Должен быть зеленый статус без device login

## Rollback команда

Если что-то пошло не так:

```bash
./rollback.sh
```

## Troubleshooting

### SSH ключ не работает
```bash
# Проверить права доступа
ls -la ~/.ssh/
chmod 600 ~/.ssh/cloudways_deploy_key
chmod 644 ~/.ssh/cloudways_deploy_key.pub
```

### GitHub Actions все еще просит device login
- Убедитесь, что `CLOUDWAYS_SSH_PASS` удален из secrets
- Проверьте, что workflow использует SSH ключ, а не пароль

### Сервер отклоняет подключение
```bash
# Проверить логи SSH
sudo tail -f /var/log/auth.log

# Проверить authorized_keys
cat ~/.ssh/authorized_keys
```
