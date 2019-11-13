#!/bin/sh

#  Script.sh
#  GearRefreshControl
#
#  Created by yanglei on 2019/11/13.
#  Copyright © 2019 Fancy Pixel. All rights reserved.

<span style="font-size:14px;">security create-keychain -p travis ios-build.keychain
# Make the keychain the default so identities are found
security default-keychain -s ios-build.keychain
# Unlock the keychain
security unlock-keychain -p travis ios-build.keychain
# Set keychain locking timeout to 3600 seconds
security set-keychain-settings -t 3600 -u ios-build.keychain

# Add certificates to keychain and allow codesign to access them
security import ./scripts/travis/apple.cer -k ~/Library/Keychains/ios-build.keychain -T /usr/bin/codesign
security import ./scripts/travis/dist.cer -k ~/Library/Keychains/ios-build.keychain -T /usr/bin/codesign
security import ./scripts/travis/dev.cer -k ~/Library/Keychains/ios-build.keychain -T /usr/bin/codesign
security import ./scripts/travis/dist.p12 -k ~/Library/Keychains/ios-build.keychain -P "123456" -T /usr/bin/codesign
security import ./scripts/travis/dev.p12 -k ~/Library/Keychains/ios-build.keychain -P "123456" -T /usr/bin/codesign
 
echo "list keychains: "
security list-keychains
echo " ****** "
 
echo "find indentities keychains: "
security find-identity -p codesigning  ~/Library/Keychains/ios-build.keychain
echo " ****** "
 
# Put the provisioning profile in place
mkdir -p ~/Library/MobileDevice/Provisioning\ Profiles
cp "./scripts/profile/team.mobileprovision" ~/Library/MobileDevice/Provisioning\ Profiles/
cp "./scripts/profile/$PROFILE_NAME.mobileprovision" ~/Library/MobileDevice/Provisioning\ Profiles/</span>
