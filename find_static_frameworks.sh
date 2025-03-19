# Lists all static frameworks
# Cortesy of https://stackoverflow.com/questions/32591878/ios-is-it-a-static-or-a-dynamic-framework
cd output
find -E . -type f -iregex ".*\.framework\/[^./]*" -exec file {} \; | grep ': current ar archive' | sed 's/.*\/\(.*.framework\).*/\1/'