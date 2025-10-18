#!/bin/bash
echo "VirtualAndroX Local Build for Termux"
pkg update -y
pkg install -y python python-pip openjdk-17 git zip unzip
pip install buildozer cython==0.29.19
echo "Starting build... (30-60 minutes)"
buildozer -v android debug
if [ -f "bin/VirtualAndroX-1.0.0-debug.apk" ]; then
    echo "✅ SUCCESS: APK built!"
else
    echo "❌ Build failed"
fi
