#!/data/data/com.termux/files/usr/bin/python3

import os
import sys
import json
from pathlib import Path

def show_banner():
    print("""
    ╔═══════════════════════════════╗
    ║        VirtualAndroX          ║
    ║    Android Container System   ║
    ║     for Huawei Devices        ║
    ╚═══════════════════════════════╝
    
    🎯 Target: myBSN Banking on Huawei Nova 4
    🤖 Android 11 + Google Services
    🔒 Secure Sandboxed Environment
    """)

def main_menu():
    print("\n📱 MAIN MENU:")
    print("1. 🚀 Start VirtualAndroX (Android 11)")
    print("2. 📱 Launch myBSN Banking App") 
    print("3. ⚙️  Manage Android Versions")
    print("4. ℹ️  System Info")
    print("5. 🚪 Exit")
    
    choice = input("\nSelect option (1-5): ").strip()
    return choice

def main():
    show_banner()
    
    while True:
        choice = main_menu()
        
        if choice == "1":
            print("\n🚀 Starting VirtualAndroX Android 11...")
            os.system("python src/core/virtualandrox_launcher.py 11")
            print("\n✅ VirtualAndroX ready! You can now launch apps.")
            
        elif choice == "2":
            print("\n📱 Launching myBSN Banking App...")
            os.system("python src/core/app_launcher.py com.bsn.mybsn 11")
            
        elif choice == "3":
            print("\n⚙️  Android Version Management:")
            os.system("python src/core/version_manager.py")
            
        elif choice == "4":
            print("\nℹ️  System Information:")
            print(f"📁 Project: {Path.home() / 'storage' / 'shared' / 'VirtualAndroX'}")
            print("💻 Device: Huawei Nova 4 (Android 10)")
            print("🎯 Target: myBSN Banking App")
            print("🔧 Status: Phase 4 - Boot Scripts Complete")
            
        elif choice == "5":
            print("\n👋 Thank you for using VirtualAndroX!")
            print("💡 Remember: This runs Android 11 apps on your Android 10 device!")
            break
            
        else:
            print("❌ Invalid choice. Please select 1-5.")

if __name__ == "__main__":
    main()
