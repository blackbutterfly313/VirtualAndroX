[app]
title = VirtualAndroX
package.name = virtualandrox
package.domain = org.blackbutterfly313
source.dir = .
version = 1.0.0
requirements = python3,openssl,requests,psutil,colorama
orientation = portrait

[buildozer]
log_level = 2

[android]
api = 30
minapi = 21
ndk = 21.4.7075529  # Older NDK for JDK 8 compatibility
sdk = 30
p4a.branch = 2020.06.02  # Stable older version
android.arch = arm64-v8a
android.permissions = INTERNET,WRITE_EXTERNAL_STORAGE,READ_EXTERNAL_STORAGE,ACCESS_NETWORK_STATE
android.meta_data = android.app.usesCleartextTraffic=true
android.accept_sdk_license = True

[loggers]
root = INFO

[app:source.exclude_patterns]
.git,.github,bin,*.pyc,*.pyo,build
