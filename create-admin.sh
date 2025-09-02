#!/bin/bash

# Script to create test admin user for Dar'ya's Kitchen
echo "🔐 Creating test admin user..."

# Navigate to Laravel app directory
cd /home/master/applications/ygrswjnpmw/power_site

# Check if Laravel is working
if [ ! -f "artisan" ]; then
    echo "❌ Laravel artisan not found. Creating basic structure..."
    mkdir -p app/Models
    mkdir -p database/migrations
    mkdir -p storage/logs
    mkdir -p bootstrap/cache
    chmod -R 775 storage bootstrap/cache
fi

# Create test admin user via artisan tinker
echo "👤 Creating admin user: admin@test.com / test123456"
php artisan tinker --execute="
use App\Models\User;
use Illuminate\Support\Facades\Hash;

try {
    \$user = User::create([
        'name' => 'Test Admin',
        'email' => 'admin@test.com',
        'password' => Hash::make('test123456'),
        'email_verified_at' => now()
    ]);
    echo '✅ Admin created successfully: ' . \$user->email;
} catch (Exception \$e) {
    echo '❌ Error creating admin: ' . \$e->getMessage();
}
"

echo "🎉 Admin creation completed!"
echo "📧 Email: admin@test.com"
echo "🔑 Password: test123456"
echo "⚠️  Remember to change password after first login!"
