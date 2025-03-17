# Sign each framework 
for framework in "outputs"/*.xcframework; do
    framework_name=$(basename "$framework")
    if [ "$framework_name" != "Flutter.xcframework" ]; then
    echo "Signing $framework_name with identity <Your codesigning identity>"
    /usr/bin/codesign --force --sign "<Your codesigning identity>" "$framework"
    else
    echo "Skipping $framework"
    fi
done
echo "Frameworks signed successfully."