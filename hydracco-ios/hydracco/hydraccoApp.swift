//
//  hydraccoApp.swift
//  hydracco
//
//  Created by Marco Sanna on 09.03.25.
//

import SwiftUI
import Flutter
import FlutterPluginRegistrant

@main
struct hydraccoApp: App {
    /// Pass the flutter engine to all views
    @State var flutterDependencies = FlutterDependencies()

    var body: some Scene {
        WindowGroup {
            HydrationsView()
                .environment(flutterDependencies)
        }
    }
}

/// Used to inject the flutter engine into the swiftui lifecycle
@Observable
class FlutterDependencies {
    let flutterEngine = FlutterEngine(name: "hydracco badge engine")
    var pigeonHydrationApi: PigeonHydrationApi!

    init() {
        flutterEngine.run()
        /// Registers all platform plugins
        GeneratedPluginRegistrant.register(with: self.flutterEngine)
        /// Comunicates with the flutter counterpart
        pigeonHydrationApi = PigeonHydrationApi(
            binaryMessenger: flutterEngine.binaryMessenger
        )
    }
}
