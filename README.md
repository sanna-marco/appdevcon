# Hydracco

This example application serves the purpose to showcase the usage of single Flutter views in native existing
iOS or Android apps.

## Setup

The hydraccobadges folder holds the main Flutter app. This app shows rewards for good hydration. It has a simple dashboard showing
two buttons, one opening a static route to a reward, the other opening the route you would use from an integrated native app.
This route however breaks navigation and you need to restart the flutter app.

The hydracco-android folder holds the Android version of the app. It only holds a button to open the Flutter Activity.
The hydracco-ios folder holds the SwiftUI iOS app. This app shows a random list of hydration elements. Tapping a list element
opens the Flutter view.

The first 10 items open using a cached engine which you can tell from the fact, that the top animation is not shown anymore.
The second 10 items open in a fresh engine. The performance downsides are clearly visible.
The last 10 items open with an appbar. There's a button at the bottom showcasing a UIKit example, just to highlight how to
close a modal from Flutter.

## Scripts

Around the creation of frameworks and their usage in native apps there is a set of scripts, that you can look into:
 - create_frameworks.sh: Builds iOS framework files from the hydraccobadges app
 - create_aar.sh: Does the same for Android
 - codesign.sh: Codesigns the xcframework files (except the Flutter framework)
 - package_frameworks.sh: Creates checksumed zip files from the frameworks
 - Package.swift.template: Can be used to setup a library approach using Swift Package Manager
