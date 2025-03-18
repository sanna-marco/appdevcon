pluginManagement {
    repositories {
        google {
            content {
                includeGroupByRegex("com\\.android.*")
                includeGroupByRegex("com\\.google.*")
                includeGroupByRegex("androidx.*")
            }
        }
        mavenCentral()
        gradlePluginPortal()
    }
}
dependencyResolutionManagement {
    repositoriesMode.set(RepositoriesMode.PREFER_SETTINGS)
    repositories {
        google()
        mavenCentral()
        // 1. Download the flutter runtime
        maven(url = "https://storage.googleapis.com/download.flutter.io")
        // 2. Access the aar - pom files from the local system
        maven(url = "../hydraccobadges/build/host/outputs/repo")
    }
}

rootProject.name = "Hydracco"
include(":app")

 