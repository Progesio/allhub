# 🚀 Laravel Development Environment - GitHub Codespaces

This repository is configured to work seamlessly with GitHub Codespaces for Laravel development with PHP 8.3 and MySQL.

## 📋 Quick Start

### 1. **Create a Codespace**
- Click the green "Code" button on GitHub
- Select "Codespaces" tab
- Click "Create codespace on main"

### 2. **Wait for Setup**
The environment will automatically:
- Install PHP 8.3 with all Laravel extensions
- Set up MySQL 8.0 database
- Install Composer dependencies
- Install Node.js dependencies
- Configure Xdebug for debugging
- Set up Nginx web server

### 3. **Start Development**
Once setup is complete, use the helper script:

```bash
# Start Laravel development server
./.devcontainer/laravel-dev.sh serve

# Start Vite for frontend assets
./.devcontainer/laravel-dev.sh vite

# View all Codespaces URLs
./.devcontainer/laravel-dev.sh codespace
```

## 🌐 Access Points

When running in GitHub Codespaces, your applications will be available at:

- **Laravel App**: `https://[CODESPACE_NAME]-8000.app.github.dev`
- **Nginx Web Server**: `https://[CODESPACE_NAME]-80.app.github.dev`
- **phpMyAdmin**: `https://[CODESPACE_NAME]-8080.app.github.dev`
- **Vite Dev Server**: `https://[CODESPACE_NAME]-5173.app.github.dev`

## 🗄️ Database Configuration

**MySQL Connection Details:**
- **Host**: `mysql` (container name)
- **Port**: `3306`
- **Database**: `progesio_ips`
- **Username**: `progesio_root`
- **Password**: `admin@moflip.com`
- **Test Database**: `progesio_ips_test`

## 🛠️ Development Commands

Use the helper script for common tasks:

```bash
# Development server
./.devcontainer/laravel-dev.sh serve

# Frontend development
./.devcontainer/laravel-dev.sh vite

# Database operations
./.devcontainer/laravel-dev.sh migrate
./.devcontainer/laravel-dev.sh migrate:fresh

# Testing
./.devcontainer/laravel-dev.sh test

# Laravel Tinker
./.devcontainer/laravel-dev.sh tinker

# View logs
./.devcontainer/laravel-dev.sh logs

# Clear caches
./.devcontainer/laravel-dev.sh cache:clear

# Install dependencies
./.devcontainer/laravel-dev.sh composer
./.devcontainer/laravel-dev.sh npm

# Show Codespaces URLs
./.devcontainer/laravel-dev.sh codespace
```

## 🔧 Environment Features

### **PHP 8.3**
- All Laravel required extensions
- Xdebug for debugging
- Composer pre-installed
- Optimized for Laravel development

### **MySQL 8.0**
- Persistent database storage
- phpMyAdmin interface
- Separate test database
- Proper authentication setup

### **Development Tools**
- VS Code extensions for Laravel
- Node.js and NPM for frontend
- Nginx web server
- Hot reload with Vite
- Git integration

### **GitHub Codespaces Optimizations**
- Automatic port forwarding
- HTTPS URLs with proper domains
- Persistent storage for database
- Pre-configured environment variables
- Fast startup with caching

## 🚀 Getting Started with Development

1. **After Codespace is ready**, run:
   ```bash
   ./.devcontainer/laravel-dev.sh serve
   ```

2. **Open the Laravel application** at the forwarded port URL

3. **For frontend development**, run in a new terminal:
   ```bash
   ./.devcontainer/laravel-dev.sh vite
   ```

4. **Access phpMyAdmin** for database management at the phpMyAdmin URL

## 🔍 Troubleshooting

### **Database Connection Issues**
- Ensure MySQL container is running
- Check `.env` file has correct database settings
- Run migrations: `./.devcontainer/laravel-dev.sh migrate`

### **Port Access Issues**
- Ports are automatically forwarded by Codespaces
- Check "Ports" tab in VS Code for URLs
- Use `./.devcontainer/laravel-dev.sh codespace` to see all URLs

### **Permission Issues**
- Run: `sudo chown -R vscode:vscode /workspaces/allhub`
- Ensure storage and cache directories are writable

## 📁 Project Structure

```
.devcontainer/
├── devcontainer.json      # Main Codespaces configuration
├── docker-compose.yml     # Multi-container setup
├── Dockerfile            # PHP 8.3 + Laravel environment
├── setup.sh              # Automated setup script
├── laravel-dev.sh         # Development helper commands
└── configs/              # Service configurations
```

## 🎯 Next Steps

1. **Customize the environment** by editing `.devcontainer/devcontainer.json`
2. **Add more services** to `docker-compose.yml` if needed
3. **Install additional VS Code extensions** via the extensions marketplace
4. **Configure your Laravel application** in the `allhub/` directory

Happy coding! 🎉
