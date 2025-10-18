#!/bin/bash
# Manual Buildozer Initialization

echo "🔧 Initializing Buildozer manually..."

# Create necessary directories
mkdir -p .buildozer/android/platform
mkdir -p bin

# Initialize Buildozer project
buildozer init <<< "y"

# Download python-for-android manually
echo "📦 Downloading python-for-android..."
git clone https://github.com/kivy/python-for-android.git .buildozer/android/platform/python-for-android || echo "⚠️  Clone failed, continuing..."

# Try to build
echo "🚀 Attempting build..."
buildozer -v android debug

if [ $? -eq 0 ]; then
    echo "✅ Build successful!"
    ls -la bin/
else
    echo "❌ Build failed, but initialization completed."
fi
