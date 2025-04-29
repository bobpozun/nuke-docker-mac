#!/bin/bash

echo "🚀 Starting complete Docker removal..."

# Stop Docker if running
echo "⛔ Stopping Docker-related processes..."
pkill -f Docker
pkill -f docker
pkill -f com.docker.backend

sleep 2

# Remove Docker application leftovers
echo "🧹 Removing Docker application files..."
rm -rf /Applications/Docker.app
rm -rf ~/Applications/Docker.app

# Remove Docker CLI tools
echo "🧹 Removing Docker CLI binaries..."
sudo rm -f /usr/local/bin/docker
sudo rm -f /usr/local/bin/docker-compose
sudo rm -f /usr/local/bin/docker-credential-desktop
sudo rm -f /usr/local/bin/docker-credential-ecr-login
sudo rm -f /usr/local/bin/docker-machine
sudo rm -f /usr/local/bin/com.docker.cli
sudo rm -f /usr/local/bin/hub-tool

# Remove Docker system files and caches
echo "🧹 Removing Docker system files and caches..."
sudo rm -rf /Library/PrivilegedHelperTools/com.docker.vmnetd
sudo rm -rf /Library/LaunchDaemons/com.docker.vmnetd.plist
sudo rm -rf ~/Library/Containers/com.docker.docker
sudo rm -rf ~/Library/Containers/com.docker.helper
sudo rm -rf ~/Library/Group\ Containers/group.com.docker
sudo rm -rf ~/Library/Application\ Support/Docker\ Desktop
sudo rm -rf ~/Library/Application\ Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/com.docker.docker.sfl*
sudo rm -rf ~/Library/Preferences/com.docker.docker.plist
sudo rm -rf ~/Library/Logs/Docker\ Desktop
sudo rm -rf ~/Library/Caches/com.docker.docker
sudo rm -rf ~/Library/Saved\ Application\ State/com.electron.docker-frontend.savedState

# Remove any Docker virtual disks
echo "🧹 Removing Docker virtual machine data..."
sudo rm -rf ~/Library/Containers/com.docker.docker/Data/vms/*
sudo rm -rf ~/Library/Containers/com.docker.helper/Data/vms/*
sudo rm -rf ~/Library/Group\ Containers/group.com.docker/*

# Forget packages if they exist
echo "🧹 Forgetting any installed Docker packages..."
pkgutil --forget com.docker.docker
pkgutil --forget com.docker.cli
pkgutil --forget com.electron.docker-frontend

# Remove LaunchAgents
echo "🧹 Removing Docker LaunchAgents..."
rm -f ~/Library/LaunchAgents/com.docker.helper.plist
rm -f ~/Library/LaunchAgents/com.docker.backend.plist

# Remove login items if any
echo "🧹 Checking login items..."
osascript -e 'tell application "System Events" to delete every login item whose name is "Docker"'

echo "✅ Docker removal complete."

echo "🔄 It is highly recommended you RESTART your Mac now to fully clear any lingering services."
