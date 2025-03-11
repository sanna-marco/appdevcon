//
//  BadgeView.swift
//  hydracco
//
//  Created by Marco Sanna on 11.03.25.
//

import SwiftUI
import Flutter

struct BadgeView: UIViewControllerRepresentable {
    let rewardMessage: String
    let id: Int
    // Flutter dependencies are passed in through the view environment.
    @Environment(FlutterDependencies.self) var flutterDependencies

    func makeUIViewController(context: Context) -> some UIViewController {
        flutterDependencies.flutterEngine.viewController = nil
        let message = rewardMessage.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        let controller = FlutterViewController(
            engine: flutterDependencies.flutterEngine,
            nibName: nil,
            bundle: nil
        )
        controller.pushRoute("/badgeonly/\(message)")
        return controller
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
}
