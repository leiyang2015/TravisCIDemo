#!/bin/sh

#  remove-key.sh
#  TravisCIDemo
#
#  Created by yanglei on 2019/11/13.
#  Copyright © 2019 yanglei. All rights reserved.

security delete-keychain ios-build.keychain
rm -f ~/Library/MobileDevice/Provisioning\ Profiles/$PROFILE_NAME.mobileprovision
rm -f ~/Library/MobileDevice/Provisioning\ Profiles/team.mobileprovision
