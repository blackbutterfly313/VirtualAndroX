[app]

# App information
title = VirtualAndroX
package.name = virtualandrox
package.domain = org.blackbutterfly313

# Source code
source.dir = .
source.include_exts = py,png,jpg,kv,atlas,json,sh,txt,md,yaml,spec

# Requirements
requirements = python3,openssl,requests,psutil,colorama

# Permissions
android.permissions = INTERNET,ACCESS_NETWORK_STATE,READ_EXTERNAL_STORAGE,WRITE_EXTERNAL_STORAGE

# Version
version = 1.0.0
version.code = 1

# Orientation
orientation = portrait

# Android configuration
android.api = 30
android.minapi = 21
android.sdk = 30
android.ndk = 25b
android.allow_backup = True

# Buildozer configuration
log_level = 2

[buildozer]

# Buildozer directory
buildozer.dir = /github/workspace
