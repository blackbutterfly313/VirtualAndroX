#!/data/data/com.termux/files/usr/bin/python3

import json
from pathlib import Path

class VersionManager:
    def __init__(self):
        self.base_dir = Path.home() / "storage" / "shared" / "VirtualAndroX"
        self.config_file = self.base_dir / "config" / "android_versions.json"
    
    def list_versions(self):
        """List all available Android versions"""
        with open(self.config_file, 'r') as f:
            config = json.load(f)
        
        versions = config.get('versions', {})
        print("📱 Available Android Versions:")
        for version, details in versions.items():
            status = "🟢 Ready" if self.check_version_ready(version) else "🟡 Not Downloaded"
            print(f"  Android {version}: {details['name']} - {status}")
    
    def check_version_ready(self, android_version):
        """Check if Android version is ready to boot"""
        version_dir = self.base_dir / "src" / "android_versions" / f"android_{android_version}"
        return version_dir.exists()
    
    def add_version(self, version, name, ram_required=280):
        """Add new Android version configuration"""
        with open(self.config_file, 'r') as f:
            config = json.load(f)
        
        config['versions'][str(version)] = {
            'name': name,
            'system_image': f"android{version}_lightweight.img",
            'gms_config': f"microg_android{version}.json",
            'required_ram': ram_required,
            'kernel_params': ["androidboot.selinux=permissive"]
        }
        
        with open(self.config_file, 'w') as f:
            json.dump(config, f, indent=2)
        
        print(f"✅ Android {version} configuration added!")

def main():
    vm = VersionManager()
    vm.list_versions()

if __name__ == "__main__":
    main()
