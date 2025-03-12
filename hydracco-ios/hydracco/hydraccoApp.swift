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
 init() {
     flutterEngine.run()
   // Connects plugins with iOS platform code to this app.
   GeneratedPluginRegistrant.register(with: self.flutterEngine);
 }
}
