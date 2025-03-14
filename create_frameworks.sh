# Build ios frameworks

# Remove old output first
rm -rf outputs

# Step into the flutter project
cd hydraccobadges

# Remove all hidden build files first
flutter clean

# Recreate the .ios folder
flutter pub get

# Build fresh frameworks
flutter build ios-framework --no-profile --no-release --output=../outputs
cd ..