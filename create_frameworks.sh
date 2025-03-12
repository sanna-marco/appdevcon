# Build ios frameworks
rm -rf outputs
cd hydraccobadges
rm -rf .ios/DerivedData
flutter clean
flutter pub get
flutter build ios-framework --no-profile --no-release --output=../outputs
cd ..