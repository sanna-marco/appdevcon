# Build Android artifacts

# Step into the flutter project
cd hydraccobadges

# Remove all hidden build files first
flutter clean

# Recreate the .android folder
flutter pub get

# Build fresh android
flutter build aar --no-profile --no-release
cd ..