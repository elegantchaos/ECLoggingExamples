echo Testing iOS ECLoggingSample

base=`dirname $0`
source "$base/../../../Tests/ECUnitTests/Scripts/test-common.sh"

xcodebuild -workspace "ECLoggingSample.xcworkspace" -scheme "ECLoggingIOS" -sdk "$testSDKiOS"
xcodebuild -workspace "ECLoggingSample.xcworkspace" -scheme "ECLoggingSampleIOS" -sdk "$testSDKiOS"
