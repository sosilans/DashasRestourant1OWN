# 🚀 How to Deploy - Dar'ya's Kitchen

## Quick Deploy (10 lines)

1. **Push to main branch** - GitHub Actions deploys automatically
2. **Check Actions tab** - Look for green "Deploy to Cloudways" 
3. **Verify site** - Visit https://phpstack-1511050-5820602.cloudwaysapps.com/
4. **Health check** - Visit https://phpstack-1511050-5820602.cloudwaysapps.com/health.html

## Manual Rollback

```bash
./rollback.sh
```

## Troubleshooting

- **Red deploy?** Check GitHub Actions logs
- **Site down?** Run rollback script
- **Device login loop?** Follow SSH_SETUP_INSTRUCTIONS.md

## Files Structure

- `NEW_FRONTEND/` - Your website files
- `.github/workflows/deploy.yml` - Deployment pipeline
- `rollback.sh` - Quick rollback script
- `health.html` - Health check endpoint

## Status

✅ **Stable deployment pipeline**  
✅ **SSH key authentication**  
✅ **Automatic backups**  
✅ **Health checks**  
✅ **Rollback procedures**  

---
**Last Updated:** $(date)  
**Version:** 2.0 (Stabilized)
