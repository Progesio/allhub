#!/bin/bash

# Laravel Development Helper Script

GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${BLUE}🚀 Laravel Development Helper${NC}"
echo ""

case "$1" in
    "serve")
        echo -e "${GREEN}Starting Laravel development server...${NC}"
        cd /workspaces/allhub/allhub && php artisan serve --host=0.0.0.0 --port=8000
        ;;
    "vite")
        echo -e "${GREEN}Starting Vite development server...${NC}"
        cd /workspaces/allhub/allhub && npm run dev -- --host=0.0.0.0
        ;;
    "test")
        echo -e "${GREEN}Running Laravel tests...${NC}"
        cd /workspaces/allhub/allhub && php artisan test
        ;;
    "migrate")
        echo -e "${GREEN}Running database migrations...${NC}"
        cd /workspaces/allhub/allhub && php artisan migrate
        ;;
    "migrate:fresh")
        echo -e "${YELLOW}Refreshing database with fresh migrations...${NC}"
        cd /workspaces/allhub/allhub && php artisan migrate:fresh --seed
        ;;
    "tinker")
        echo -e "${GREEN}Starting Laravel Tinker...${NC}"
        cd /workspaces/allhub/allhub && php artisan tinker
        ;;
    "logs")
        echo -e "${GREEN}Showing Laravel logs...${NC}"
        cd /workspaces/allhub/allhub && tail -f storage/logs/laravel.log
        ;;
    "cache:clear")
        echo -e "${GREEN}Clearing all caches...${NC}"
        cd /workspaces/allhub/allhub && php artisan config:clear && php artisan cache:clear && php artisan view:clear && php artisan route:clear
        ;;
    "composer")
        echo -e "${GREEN}Installing Composer dependencies...${NC}"
        cd /workspaces/allhub/allhub && composer install
        ;;
    "npm")
        echo -e "${GREEN}Installing NPM dependencies...${NC}"
        cd /workspaces/allhub/allhub && npm install
        ;;
    "codespace")
        echo -e "${BLUE}GitHub Codespaces URLs:${NC}"
        if [ -n "$CODESPACE_NAME" ]; then
            echo "  Laravel:    https://$CODESPACE_NAME-8000.app.github.dev"
            echo "  Nginx:      https://$CODESPACE_NAME-80.app.github.dev"
            echo "  phpMyAdmin: https://$CODESPACE_NAME-8080.app.github.dev"
            echo "  Vite:       https://$CODESPACE_NAME-5173.app.github.dev"
        else
            echo "  Not running in GitHub Codespaces"
        fi
        ;;
    *)
        echo -e "${YELLOW}Usage: $0 {serve|vite|test|migrate|migrate:fresh|tinker|logs|cache:clear|composer|npm|codespace}${NC}"
        echo ""
        echo -e "${BLUE}Available commands:${NC}"
        echo "  serve         - Start Laravel development server"
        echo "  vite          - Start Vite development server"
        echo "  test          - Run Laravel tests"
        echo "  migrate       - Run database migrations"
        echo "  migrate:fresh - Fresh migrations with seeding"
        echo "  tinker        - Start Laravel Tinker"
        echo "  logs          - Show Laravel logs"
        echo "  cache:clear   - Clear all caches"
        echo "  composer      - Install Composer dependencies"
        echo "  npm           - Install NPM dependencies"
        echo "  codespace     - Show GitHub Codespaces URLs"
        ;;
esac
