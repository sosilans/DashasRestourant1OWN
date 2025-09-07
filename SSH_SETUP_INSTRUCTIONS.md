# 🔐 SSH Password Setup Instructions

## Проблема Device Login Loop

**Причина:** GitHub Actions использует интерактивную аутентификацию, что вызывает device login loop в headless CI среде.

**Решение:** Использовать `sshpass` для неинтерактивной аутентификации с паролем.

## Шаги настройки

### 1. Проверить GitHub Secrets

Убедитесь, что у вас есть эти secrets в GitHub → Settings → Secrets and variables → Actions:

- `CLOUDWAYS_SSH_HOST`: `143.110.155.248`
- `CLOUDWAYS_SSH_USER`: `silans`
- `CLOUDWAYS_SSH_PASS`: `GameManPlay1337!`

### 2. Тестирование подключения

```bash
# Тест SSH подключения с паролем
ssh silans@143.110.155.248

# Или с sshpass (для автоматизации)
sshpass -p "GameManPlay1337!" ssh silans@143.110.155.248
```

### 3. Проверка пути к приложению

```bash
# Подключиться к серверу
ssh silans@143.110.155.248

# Найти путь к приложению
ls -la ~/applications/
# Должен быть каталог типа ygrswjnpmw или подобный
```

## Текущие GitHub Secrets

Убедитесь, что у вас есть эти secrets:

- `CLOUDWAYS_SSH_HOST`: `143.110.155.248`
- `CLOUDWAYS_SSH_USER`: `silans`
- `CLOUDWAYS_SSH_PASS`: `GameManPlay1337!`

## Как это работает

- `sshpass` автоматически передает пароль в SSH
- Нет интерактивных запросов = нет device login loop
- Пароль остается безопасным в GitHub Secrets

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
