#!/usr/bin/env python3

import os
import sys
import json
from pathlib import Path

# Add the src directory to Python path
sys.path.append(os.path.join(os.path.dirname(__file__), 'src'))

from core.virtualandrox_launcher import VirtualAndroXCore
from core.version_manager import VersionManager
from core.app_launcher import AppLauncher

def android_main():
    """Main entry point for Android APK"""
    print("🤖 VirtualAndroX Android App Starting...")
    
    # Android-specific initialization
    android_data_dir = "/data/data/org.blackbutterfly313.virtualandrox/files"
    
    # Create necessary directories
    os.makedirs(android_data_dir, exist_ok=True)
    
    # Initialize core components
    vax_core = VirtualAndroXCore()
    version_manager = VersionManager()
    app_launcher = AppLauncher()
    
    print("✅ VirtualAndroX Android App Ready!")
    
    # Show main menu
    show_android_menu(vax_core, version_manager, app_launcher)

def show_android_menu(vax_core, version_manager, app_launcher):
    """Android-optimized menu"""
    while True:
        print("\n" + "="*50)
        print("🤖 VIRTUALANDROX - ANDROID APP")
        print("="*50)
        print("1. 🚀 Start Android 11 Environment")
        print("2. 🏦 Launch myBSN Banking")
        print("3. 📱 Check Available Versions")
        print("4. ℹ️  App Info")
        print("5. 🚪 Exit")
        print("="*50)
        
        try:
            choice = input("Choose option (1-5): ").strip()
            
            if choice == "1":
                print("\n🚀 Starting Android 11...")
                success = vax_core.boot_android_version(11)
                if success:
                    print("✅ Android 11 Environment Ready!")
                else:
                    print("❌ Failed to start Android 11")
                    
            elif choice == "2":
                print("\n🏦 Launching myBSN Banking...")
                success = app_launcher.launch_app("com.bsn.mybsn", 11)
                if success:
                    print("✅ myBSN Ready for Banking!")
                else:
                    print("❌ Failed to launch myBSN")
                    
            elif choice == "3":
                print("\n📱 Available Android Versions:")
                version_manager.list_versions()
                
            elif choice == "4":
                show_app_info()
                
            elif choice == "5":
                print("\n👋 Thank you for using VirtualAndroX!")
                print("💡 Remember to use myBSN securely!")
                break
                
            else:
                print("❌ Invalid choice. Please select 1-5.")
                
        except (EOFError, KeyboardInterrupt):
            print("\n👋 Goodbye!")
            break

def show_app_info():
    """Show app information"""
    print("\n" + "="*50)
    print("📱 VIRTUALANDROX - APP INFORMATION")
    print("="*50)
    print("🤖 Version: 1.0.0 (APK)")
    print("📦 Package: org.blackbutterfly313.virtualandrox")
    print("🎯 Purpose: Run Android 11 apps on Android 10")
    print("🏦 Target: myBSN Banking App")
    print("📱 Device: Huawei Nova 4")
    print("🔒 Security: Sandboxed Environment")
    print("💻 Developer: blackbutterfly313")
    print("📧 Email: fuadpiphijau@gmail.com")
    print("="*50)
    print("💡 Features:")
    print("   ✅ Android 11 Virtualization")
    print("   ✅ Google Services Compatibility")
    print("   ✅ Secure Banking Environment")
    print("   ✅ Lightweight (280MB RAM)")
    print("="*50)

if __name__ == '__main__':
    android_main()
