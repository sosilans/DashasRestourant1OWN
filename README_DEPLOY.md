# Deployment Guide - Dar'ya's Kitchen

## 🚀 Quick Deploy

### Automatic Deployment (GitHub Actions)
1. Push to `main` branch
2. GitHub Actions automatically deploys to Cloudways
3. Check Actions tab for deployment status

### Manual Deployment
```bash
# SSH to server
ssh master@143.110.155.248

# Navigate to app directory
cd ~/applications/ygrswjnpmw

# Run deployment script
chmod +x ci-bootstrap/deploy-enhanced.sh
./ci-bootstrap/deploy-enhanced.sh
```

## 🔧 Troubleshooting

### Common Issues

#### 1. Laravel App Not Found
**Problem**: `power_site/` directory doesn't exist
**Solution**: 
- Run bootstrap workflow first: Go to Actions → "Bootstrap Laravel" → Run workflow
- Or run enhanced deploy script which creates Laravel app automatically

#### 2. Permission Denied
**Problem**: File permission errors
**Solution**:
```bash
chmod -R 755 public_html
chmod 644 public_html/*.html
chmod 644 public_html/*.php
```

#### 3. Database Connection Failed
**Problem**: Database credentials incorrect
**Solution**:
- Check `SERVER_ENV` secret in GitHub
- Verify database exists on Cloudways
- Update `.env` file on server

#### 4. Composer/Node Not Found
**Problem**: Missing dependencies
**Solution**:
- Install Composer: `curl -sS https://getcomposer.org/installer | php`
- Install Node.js: `curl -fsSL https://deb.nodesource.com/setup_22.x | sudo -E bash -`

### Rollback Procedure

#### Quick Rollback
```bash
# SSH to server
ssh master@143.110.155.248
cd ~/applications/ygrswjnpmw

# Run rollback script
./rollback.sh
```

#### Manual Rollback
```bash
# Restore from backup
cp backups/db_backup_YYYYMMDD_HHMMSS.sql power_site/

# Restore previous files (if you have backup)
# cp -a backup_previous/* power_site/

# Restart services
php artisan up
```

## 📋 Required GitHub Secrets

Ensure these secrets are configured in GitHub → Settings → Secrets and variables → Actions:

- `CLOUDWAYS_SSH_HOST`: `143.110.155.248`
- `CLOUDWAYS_SSH_USER`: `master` (or your Cloudways user)
- `CLOUDWAYS_SSH_KEY`: Your private SSH key (OpenSSH format)
- `CLOUDWAYS_SSH_PASS`: Your SSH password (alternative to key)
- `CLOUDWAYS_APP_DIR`: `~/applications/ygrswjnpmw/public_html`
- `SERVER_ENV`: Complete `.env` file contents

## 🔍 Health Checks

### Local Health Check
```bash
curl -f https://phpstack-1511050-5820602.cloudwaysapps.com/
```

### Server Health Check
```bash
# Check if site is responding
curl -f http://localhost/

# Check Laravel logs
tail -f power_site/storage/logs/laravel.log

# Check PHP errors
tail -f /var/log/apache2/error.log
```

## 📊 Monitoring

### Check Deployment Status
1. Go to GitHub → Actions
2. Look for "Deploy to Cloudways" workflow
3. Check logs for any errors

### Server Monitoring
```bash
# Check disk space
df -h

# Check memory usage
free -h

# Check running processes
ps aux | grep php
```

## 🛠️ Development Workflow

### Making Changes
1. Edit files in `ci-bootstrap/` or `power_site/`
2. Test locally (if possible)
3. Commit and push to `main`
4. GitHub Actions deploys automatically
5. Verify on live site

### Testing Checklist
- [ ] Site loads without errors
- [ ] All pages accessible
- [ ] Forms work correctly
- [ ] Mobile responsive
- [ ] Database connections work
- [ ] File uploads work (if applicable)

## 🚨 Emergency Procedures

### Site Down
1. Check GitHub Actions for failed deployments
2. SSH to server and check logs
3. Restore from backup if necessary
4. Contact support if needed

### Database Issues
1. Check database connection in `.env`
2. Verify database exists on Cloudways
3. Restore from backup if corrupted
4. Run migrations if needed

### File Permission Issues
```bash
# Fix ownership
sudo chown -R www-data:www-data public_html
sudo chown -R www-data:www-data power_site/storage
sudo chown -R www-data:www-data power_site/bootstrap/cache

# Fix permissions
chmod -R 755 public_html
chmod -R 775 power_site/storage
chmod -R 775 power_site/bootstrap/cache
```

## 📞 Support Contacts

- **GitHub Issues**: Create issue in repository
- **Cloudways Support**: Use Cloudways support portal
- **Emergency**: SSH access and manual fixes

---

**Last Updated**: $(date)
**Version**: 1.0

