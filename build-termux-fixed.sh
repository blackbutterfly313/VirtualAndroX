#!/bin/bash
echo "🧩 VirtualAndroX Termux Build - Header Fix"
echo "=========================================="

# Set environment variables for Termux
export C_INCLUDE_PATH="$PREFIX/include"
export CPLUS_INCLUDE_PATH="$PREFIX/include"
export LIBRARY_PATH="$PREFIX/lib"
export PKG_CONFIG_PATH="$PREFIX/lib/pkgconfig"

echo "📁 Checking header files..."
if [ -f "$PREFIX/include/zlib.h" ]; then
    echo "✅ zlib headers found"
else
    echo "❌ zlib headers missing - reinstalling zlib"
    pkg reinstall -y zlib
fi

if [ -f "$PREFIX/include/png.h" ]; then
    echo "✅ libpng headers found"
else
    echo "❌ libpng headers missing - reinstalling libpng"
    pkg reinstall -y libpng
fi

# Create a buildozer.spec that works with Termux
echo "📄 Creating Termux-compatible build configuration..."
cat > buildozer-termux.spec << 'SPEC'
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
ndk = 25b
sdk = 30
p4a.branch = master
android.arch = arm64-v8a
android.permissions = INTERNET,WRITE_EXTERNAL_STORAGE,READ_EXTERNAL_STORAGE
android.accept_sdk_license = True

# Set environment for Termux
env.ARCH = aarch64
env.C_INCLUDE_PATH = $PREFIX/include
env.CPLUS_INCLUDE_PATH = $PREFIX/include
env.LIBRARY_PATH = $PREFIX/lib

[loggers]
root = INFO

[app:source.exclude_patterns]
.git,.github,bin,*.pyc,*.pyo,build
SPEC

echo "🏗️ Starting build with fixed environment..."
echo "⚠️ This will take 30-60 minutes"

buildozer -v android debug --profile buildozer-termux.spec

if [ -f "bin/VirtualAndroX-1.0.0-debug.apk" ]; then
    echo ""
    echo "🎉 SUCCESS! VirtualAndroX APK built!"
    echo "📱 File: bin/VirtualAndroX-1.0.0-debug.apk"
    echo "💾 Size: $(du -h bin/VirtualAndroX-1.0.0-debug.apk | cut -f1)"
else
    echo "❌ Build failed. Trying alternative approach..."
    
    # Try with even more minimal configuration
    echo "🔄 Attempting ultra-minimal build..."
    cat > buildozer-ultra.spec << 'ULTRA'
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
api = 28
minapi = 21
ndk = 21.4.7075529
sdk = 28
p4a.branch = 2020.06.02
android.arch = arm64-v8a
android.permissions = INTERNET
android.accept_sdk_license = True
ULTRA
    
    buildozer -v android debug --profile buildozer-ultra.spec
    
    if [ -f "bin/VirtualAndroX-1.0.0-debug.apk" ]; then
        echo "🎉 SUCCESS with ultra-minimal build!"
        echo "📱 File: bin/VirtualAndroX-1.0.0-debug.apk"
    else
        echo "❌ All build attempts failed."
        echo "💡 Try building on a Linux system or use GitHub Actions."
    fi
fi
