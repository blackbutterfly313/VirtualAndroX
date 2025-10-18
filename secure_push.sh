#!/bin/bash
echo "🚀 Secure push to GitHub..."
git add .
git commit -m "Update: $(date +'%Y-%m-%d %H:%M:%S')"
git push origin main
echo "✅ Pushed securely!"
