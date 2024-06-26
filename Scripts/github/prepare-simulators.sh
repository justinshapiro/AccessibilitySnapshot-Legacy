#!/bin/bash -l
set -ex

IFS=','; PLATFORMS=$(echo $1); unset IFS

sudo mkdir -p /Library/Developer/CoreSimulator/Profiles/Runtimes

if [[ ${PLATFORMS[*]} =~ 'iOS_13' ]]; then
	sudo ln -s /Applications/Xcode_11.3.1.app/Contents/Developer/Platforms/iPhoneOS.platform/Library/Developer/CoreSimulator/Profiles/Runtimes/iOS.simruntime /Library/Developer/CoreSimulator/Profiles/Runtimes/iOS\ 13.3.simruntime
fi

if [[ ${PLATFORMS[*]} =~ 'iOS_12' ]]; then
	sudo ln -s /Applications/Xcode_10.3.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/Library/CoreSimulator/Profiles/Runtimes/iOS.simruntime /Library/Developer/CoreSimulator/Profiles/Runtimes/iOS\ 12.4.simruntime
fi

xcrun simctl list runtimes
