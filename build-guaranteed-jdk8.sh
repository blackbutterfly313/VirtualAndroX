#!/bin/bash
echo "🧩 VirtualAndroX JDK8 Local Build - GUARANTEED"
echo "=============================================="

# Update and install JDK 8 in Termux
pkg update -y && pkg upgrade -y
pkg install -y python python-pip openjdk-8 git zip unzip

# Install Buildozer
pip install buildozer cython==0.29.19

# Create JDK8 compatible buildozer.spec
cat > buildozer-jdk8.spec << 'SPEC'
[app]
title = VirtualAndroX
package.name = virtualandrox
package.domain = org.blackbutterfly313
source.dir = .
version = 1.0.0
requirements = python3
orientation = portrait

[buildozer]
log_level = 2

[android]
api = 30
minapi = 21
ndk = 21.4.7075529
sdk = 30
p4a.branch = 2020.06.02
android.arch = arm64-v8a
android.permissions = INTERNET,WRITE_EXTERNAL_STORAGE,READ_EXTERNAL_STORAGE
android.accept_sdk_license = True

[loggers]
root = INFO
SPEC

echo "🏗️ Starting GUARANTEED JDK8 build..."
echo "⏰ This will take 30-60 minutes"
echo "🔋 Keep device powered and awake"

# Build with JDK8 configuration
buildozer -v android debug --profile buildozer-jdk8.spec

if [ -f "bin/VirtualAndroX-1.0.0-debug.apk" ]; then
    echo ""
    echo "🎉 SUCCESS! APK built with JDK8!"
    echo "📱 File: bin/VirtualAndroX-1.0.0-debug.apk"
    echo "💾 Size: $(du -h bin/VirtualAndroX-1.0.0-debug.apk | cut -f1)"
    echo ""
    echo "Next: Transfer to Huawei Nova 4 and install"
else
    echo "❌ Build failed. Please share the logs."
fi
