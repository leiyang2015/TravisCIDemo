#!/bin/sh

#  sign-and-upload.sh
#  TravisCIDemo
#
#  Created by yanglei on 2019/11/13.
#  Copyright © 2019 yanglei. All rights reserved.

#!/bin/sh
if [[ "$TRAVIS_PULL_REQUEST" != "false" ]]; then
  echo "This is a pull request. No deployment will be done."
  exit 0
fi
if [[ "$TRAVIS_BRANCH" != "dev" ]]; then
  echo "Testing on a branch other than dev. No deployment will be done."
  exit 0
fi
PROVISIONING_PROFILE="$HOME/Library/MobileDevice/Provisioning Profiles/$PROFILE_NAME.mobileprovision"
OUTPUTDIR="$PWD/build/Release-iphoneos"
xcrun -log -sdk iphoneos PackageApplication "$OUTPUTDIR/$APPNAME.app" -o "$OUTPUTDIR/$APPNAME.ipa" -sign "$DEVELOPER_NAME" -embed "$PROVISIONING_PROFILE"
fir p $OUTPUTDIR/$APPNAME.ipa -T "938f564500c3337a9c0037972e924acc"
#curl http://www.pgyer.com/apiv1/app/upload \
#  -F uKey="$PGYER_UKEY"\
#  -F file="@$OUTPUTDIR/$APPNAME.ipa" \
#  -F _api_key="$PGYER_APIKEY"
 
 

 
  RELEASE_DATE=`date '+%Y-%m-%d %H:%M:%S'`
  RELEASE_NOTES="Build: $TRAVIS_BUILD_NUMBER\nUploaded: $RELEASE_DATE"

