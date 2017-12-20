#cp -R SwiftGen ~/Library/Application\ Support

swiftgen strings SPIDSDKLoginKit/SPIDSDK/Resources/LocalizationResources/Localizable.strings --output SPIDSDKLoginKit/SPIDSDK/Resources/LocalizationResources/L10n.swift -t structured-swift3
swiftgen xcassets SPIDSDKLoginKit/Assets.xcassets --output SPIDSDKLoginKit/Resources -t swift3
#swiftgen storyboards scrigno2/Base.lproj --output scrigno2/Resources/Utility/Storyboards.swift


if [[ $? != 0 ]] ; then
    cat << EOM
error: Failed to run the swiftgen command. If you do not have swiftgen installed, you can install it via homebrew:
 
$ brew update
$ brew install swiftgen
 
For more information, visit 'https://github.com/AliSoftware/SwiftGen'.
EOM
    exit 1
fi




