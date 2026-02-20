#!/bin/bash
set -e

# Color Definitions (for better readability)
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m' # Reset

# Ensure the script runs from the correct directory
cd "$(dirname "$0")"

IMAGE_NAME="shipready-image"
CONTAINER_NAME="shipready-web"
PORT="8082"

echo -e "${BLUE}🚢 [INFO] Starting ShipReady: Optimizing your workflow...${NC}"

# 1. BUILD
echo -e "${YELLOW}🛠️  [BUILD] Building Docker image...${NC}"
if docker build -t $IMAGE_NAME -f ../config/Dockerfile ..; then
    echo -e "${GREEN}✅ [OK] Image generated successfully.${NC}"
else
    echo -e "${RED}❌ [ERROR] Image build failed.${NC}"
    exit 1
fi

# 2. CLEANUP AND RUN
echo -e "${YELLOW}🚀 [DEPLOY] Restarting container on port $PORT...${NC}"
docker rm -f $CONTAINER_NAME 2>/dev/null

if docker run -d --name $CONTAINER_NAME -p $PORT:80 $IMAGE_NAME > /dev/null; then
    
    # 3. TECHNICAL VERIFICATION (Healthcheck)
    echo -e "${YELLOW}🔍 [HEALTH] Checking if Nginx is responding...${NC}"
    sleep 2 # Give Nginx a moment to start
    
    if curl -s --head  http://localhost:$PORT | grep "200 OK" > /dev/null; then
        echo -e "${GREEN}⭐ [SUCCESS] Deploy finalized! Status: 200 OK${NC}"
        echo -e "${GREEN}🌍 URL: http://localhost:$PORT${NC}"
    else
        echo -e "${RED}⚠️  [ALERT] Container is up, but the site did not respond (200 OK).${NC}"
    fi
else
    echo -e "${RED}❌ [ERROR] Failed to run the container.${NC}"
    exit 1
fi