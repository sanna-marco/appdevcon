//
//  BadgeView.swift
//  hydracco
//
//  Created by Marco Sanna on 11.03.25.
//

import SwiftUI
import Flutter

/// Wrapper around the flutter badge to decide for the text
struct BadgeView: View {
    @State var hydration: Hydration

    var body: some View {
        switch hydration.id {
        case 0..<10:
            FlutterPerformanceView(rewardMessage: rewardMessage)
        case 10..<20:
            FlutterSlowView(rewardMessage: rewardMessage)
        default:
            FlutterImmersiveView()
        }
    }

    var rewardMessage: String {
        switch hydration.amount {
        case 0..<1.5: "YOU CAN DO BETTER"
        case 1.5..<3: "NEAR PERFECTION"
        default: "WHO'S A GOOD DRINKER?"
        }
    }
}

/// Flutter is based on viewcontrollers so we need a representable struct.
/// This struct showcases the usage of a prewarmed engine.
struct FlutterPerformanceView: UIViewControllerRepresentable {
    let rewardMessage: String
    /// Flutter dependencies are passed in through the view environment - another
    /// option would be a DI framework like `Factory`
    @Environment(FlutterDependencies.self) var flutterDependencies

    /// (Re-)creates  the viewcontroller
    func makeUIViewController(context: Context) -> some UIViewController {
        /// Removing the flutter view controller from the engine
        flutterDependencies.flutterEngine.viewController = nil
        let controller = FlutterViewController(
            engine: flutterDependencies.flutterEngine,
            nibName: nil,
            bundle: nil
        )
        return controller
    }

    /// Updates the controller with the latest data - essentially makes it navigate to the correct view
    func updateUIViewController(_ uiViewController: UIViewControllerType,
                                context: Context) {
        if let controller = uiViewController as? FlutterViewController {
            /// Navigating the flutter view controller to the correct content by using
            /// URL - kind of deeplinking, like GoRouter supports
            let message = rewardMessage
                .addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
            controller.pushRoute("/badgeonly/\(message)")
        }
    }
}

/// This example does not use a prewarmed engine
struct FlutterSlowView: UIViewControllerRepresentable {
    let rewardMessage: String

    func makeUIViewController(context: Context) -> UIViewController {
        let message = rewardMessage.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        let controller = FlutterViewController(project: nil,
                                               initialRoute: "/badgeonly/\(message)",
                                               nibName: nil,
                                               bundle: nil)
        return controller
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}

/// This example uses the same performance view as above but with a different
/// route to showcase problems in navigating
struct FlutterImmersiveView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        let controller = FlutterViewController(project: nil,
                                               initialRoute: "/badge",
                                               nibName: nil,
                                               bundle: nil)
        return controller
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}
