#!/bin/bash
# VirtualAndroX GitHub Repository Setup

echo "🚀 Setting up VirtualAndroX GitHub Repository..."

# Check if we're in the right directory
if [ ! -f "virtualandrox.py" ]; then
    echo "❌ Please run this script from the VirtualAndroX root directory"
    exit 1
fi

# Initialize git if not already done
if [ ! -d ".git" ]; then
    echo "📦 Initializing git repository..."
    git init
    git config --global user.name "blackbutterfly313"
    git config --global user.email "fuadpiphijau@gmail.com"
    git config --global --add safe.directory /storage/emulated/0/VirtualAndroX
fi

# Add all files
echo "📁 Adding files to git..."
git add .

# Create initial commit
echo "💾 Creating initial commit..."
git commit -m "feat: Initial VirtualAndroX release with GitHub Actions

- 🤖 Android 11 virtualization for Huawei devices
- 🏦 myBSN banking app compatibility
- 📱 GitHub Actions APK build pipeline
- 🔒 Secure sandboxed environment
- 📦 Automated APK releases

Developer: blackbutterfly313
Email: fuadpiphijau@gmail.com"

echo ""
echo "✅ GitHub repository setup complete!"
echo ""
echo "🚀 NEXT STEPS:"
echo "1. Create a new repository on GitHub:"
echo "   - Go to https://github.com/new"
echo "   - Name: VirtualAndroX"
echo "   - Description: Android 11 virtualization for Huawei devices"
echo "   - Make it PUBLIC or PRIVATE"
echo ""
echo "2. Connect and push your code:"
echo "   git remote add origin https://github.com/blackbutterfly313/VirtualAndroX.git"
echo "   git branch -M main"
echo "   git push -u origin main"
echo ""
echo "3. GitHub Actions will automatically build the APK!"
echo "4. Check the Actions tab in your GitHub repository"
echo "5. Download the APK from the latest workflow run"
echo ""
echo "💡 The APK will be built automatically on every push to main!"
