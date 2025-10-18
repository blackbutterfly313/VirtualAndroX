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
ndk = 23b
sdk = 30
p4a.branch = master
android.arch = arm64-v8a
android.permissions = INTERNET,WRITE_EXTERNAL_STORAGE,READ_EXTERNAL_STORAGE
android.accept_sdk_license = True

[loggers]
root = INFO
