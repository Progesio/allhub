#!/bin/bash

echo "🚀 Setting up Laravel development environment..."

# Wait for MySQL to be ready
echo "⏳ Waiting for MySQL to be ready..."
until mysql -h mysql -u progesio_root -p'admin@moflip.com' -e "SELECT 1" >/dev/null 2>&1; do
    echo "MySQL is not ready yet. Waiting..."
    sleep 2
done

echo "✅ MySQL is ready!"

# Navigate to the Laravel project directory
cd /workspace/allhub

# Install PHP dependencies
echo "📦 Installing Composer dependencies..."
composer install --no-interaction --prefer-dist --optimize-autoloader

# Install Node.js dependencies
echo "📦 Installing NPM dependencies..."
npm install

# Copy environment file if it doesn't exist
if [ ! -f .env ]; then
    echo "📝 Creating .env file..."
    cp .env.example .env
fi

# Update .env for container environment
echo "🔧 Configuring environment for containers..."
sed -i 's/DB_CONNECTION=sqlite/DB_CONNECTION=mysql/' .env
sed -i 's/# DB_HOST=localhost/DB_HOST=mysql/' .env
sed -i 's/# DB_PORT=3306/DB_PORT=3306/' .env
sed -i 's/# DB_DATABASE=progesio_ips/DB_DATABASE=progesio_ips/' .env
sed -i 's/# DB_USERNAME=progesio_root/DB_USERNAME=progesio_root/' .env
sed -i 's/# DB_PASSWORD=admin@moflip.com/DB_PASSWORD=admin@moflip.com/' .env

# Generate application key if needed
echo "🔑 Generating application key..."
php artisan key:generate --ansi

# Clear cache
echo "🧹 Clearing caches..."
php artisan config:clear
php artisan cache:clear
php artisan view:clear
php artisan route:clear

# Run migrations
echo "🗄️  Running database migrations..."
php artisan migrate --force

# Seed database if seeder exists
if [ -f database/seeders/DatabaseSeeder.php ]; then
    echo "🌱 Seeding database..."
    php artisan db:seed --force
fi

# Create storage link
echo "🔗 Creating storage symlink..."
php artisan storage:link

# Set permissions
echo "🔐 Setting permissions..."
sudo chown -R vscode:vscode /workspace
sudo chmod -R 755 /workspace/allhub/storage
sudo chmod -R 755 /workspace/allhub/bootstrap/cache

echo "✨ Laravel development environment setup complete!"
echo ""
echo "🌐 Access points:"
echo "   Laravel App: http://localhost:8000 (php artisan serve)"
echo "   Nginx:       http://localhost:80"
echo "   phpMyAdmin:  http://localhost:8080"
echo "   MySQL:       localhost:3306"
echo ""
echo "📝 Database credentials:"
echo "   Host: mysql (or localhost from host machine)"
echo "   Database: progesio_ips"
echo "   Username: progesio_root"
echo "   Password: admin@moflip.com"
echo ""
echo "🚀 To start Laravel development server:"
echo "   php artisan serve --host=0.0.0.0 --port=8000"
echo ""
echo "🎨 To start Vite development server:"
echo "   npm run dev"
