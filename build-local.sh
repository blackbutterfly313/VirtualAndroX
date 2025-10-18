#!/bin/bash
echo "🧩 VirtualAndroX Local Build Script"
echo "==================================="

if [ ! -d "/data/data/com.termux/files/usr" ]; then
    echo "❌ Error: Run this script in Termux"
    exit 1
fi

echo "📦 Updating packages..."
pkg update -y && pkg upgrade -y

echo "🔧 Installing dependencies..."
pkg install -y python python-pip openjdk-17 git zip unzip

echo "🐍 Installing Python packages..."
pip install --upgrade pip
pip install buildozer cython==0.29.19

echo "🏗️ Starting APK build..."
echo "⚠️ This will take 30-60 minutes"
echo "⚠️ Keep your device awake and connected to power"

buildozer -v android debug

if [ -f "bin/VirtualAndroX-1.0.0-debug.apk" ]; then
    echo ""
    echo "🎉 SUCCESS! VirtualAndroX APK built!"
    echo "📱 File: bin/VirtualAndroX-1.0.0-debug.apk"
    echo "💾 Size: $(du -h bin/VirtualAndroX-1.0.0-debug.apk | cut -f1)"
    echo ""
    echo "Next steps:"
    echo "1. Transfer APK to Huawei Nova 4"
    echo "2. Install and test VirtualAndroX"
    echo "3. Launch myBSN banking app"
else
    echo "❌ Build failed. Check logs above."
fi
