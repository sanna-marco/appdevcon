# Build ios frameworks
cd hydraccobadges
flutter clean
flutter pub get
flutter build ios-framework --no-profile --no-release --output=../outputs
cd ..