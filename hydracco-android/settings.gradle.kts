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
        maven("https://storage.googleapis.com/download.flutter.io")
        gradlePluginPortal()
    }
}
dependencyResolutionManagement {
    repositoriesMode.set(RepositoriesMode.PREFER_SETTINGS)
    repositories {
        google()
        mavenCentral()
        maven(url = "https://storage.googleapis.com/download.flutter.io")
    }
}

rootProject.name = "Hydracco"
include(":app")

dependencyResolutionManagement {
    repositories {
        maven(url = "https://storage.googleapis.com/download.flutter.io")
        maven(url = "some/path/flutter_module_project/build/host/outputs/repo")
    }
}
 