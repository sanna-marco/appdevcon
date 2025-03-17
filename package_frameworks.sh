# Remove flutter dsym file from app framework
# https://github.com/flutter/flutter/issues/157359
rm -rf SwiftPackage/Frameworks/Release/App.xcframework/ios-arm64/dSYMs/Flutter.framework.dSYM

# Cycle frameworks
for framework in *.xcframework; do
    framework_name=$(basename "$framework")
    # Zip framework
    zip -r "$framework_name.zip" "$framework"
    # Compute md5
    echo "Creating MD5 checksum for $framework_name.zip"
    swift package --package-path=${framework} compute-checksum $framework_name.zip > $framework_name.zip.md5
done