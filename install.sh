#!/bin/bash

# --------------------------------------------------
# Idle Screens Installer
# Self-hosted dashboard for tablets and kiosks
# --------------------------------------------------

set -e

APP_NAME="idle-screens"
INSTALL_DIR="/opt/$APP_NAME"
SERVICE_NAME="idle-screens"
PORT=3000

echo "-------------------------------------"
echo "Installing Idle Screens Dashboard..."
echo "-------------------------------------"

# Update system
echo "Updating packages..."
sudo apt update

# Install dependencies
echo "Installing dependencies..."
sudo apt install -y git unzip curl nodejs npm

# Create install directory
echo "Creating install directory..."
sudo mkdir -p $INSTALL_DIR
sudo chown $USER:$USER $INSTALL_DIR

# Copy files to install directory
echo "Copying application files..."
cp -r * $INSTALL_DIR

cd $INSTALL_DIR

# Extract settings if present
if [ -f "idle-screens-app-settings-update.zip" ]; then
    echo "Applying settings update..."
    unzip -o idle-screens-app-settings-update.zip -d settings
fi

# Extract integrations if present
if [ -f "idle-screens-app-integrations.zip" ]; then
    echo "Applying integrations..."
    unzip -o idle-screens-app-integrations.zip -d integrations
fi

# Install node dependencies
if [ -f "package.json" ]; then
    echo "Installing Node dependencies..."
    npm install
fi

# Create systemd service
echo "Creating system service..."

sudo tee /etc/systemd/system/$SERVICE_NAME.service > /dev/null <<EOF
[Unit]
Description=Idle Screens Dashboard
After=network.target

[Service]
Type=simple
User=$USER
WorkingDirectory=$INSTALL_DIR
ExecStart=/usr/bin/node server.js
Restart=always
Environment=PORT=$PORT

[Install]
WantedBy=multi-user.target
EOF

# Reload systemd
sudo systemctl daemon-reload

# Enable service
sudo systemctl enable $SERVICE_NAME

# Start service
sudo systemctl start $SERVICE_NAME

echo "-------------------------------------"
echo "Installation Complete!"
echo ""
echo "Access your dashboard at:"
echo "http://$(hostname -I | awk '{print $1}'):$PORT"
echo ""
echo "Service commands:"
echo "  sudo systemctl status $SERVICE_NAME"
echo "  sudo systemctl restart $SERVICE_NAME"
echo "-------------------------------------"
