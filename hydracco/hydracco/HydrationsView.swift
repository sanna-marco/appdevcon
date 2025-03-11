//
//  HydrationsView.swift
//  hydracco
//
//  Created by Marco Sanna on 09.03.25.
//

import SwiftUI

/// Shows a list of hydrations in a very basic list view.
/// A tap on a list item leads to the badge lizard coming from Flutter
struct HydrationsView: View {
    @State private var viewModel = HydrationsViewModel()
    private let backgroundColor = Color(red: 0.62, green: 0.89, blue: 0.77)

    var body: some View {
        NavigationStack {
            Group {
                if viewModel.hydrations.isEmpty {
                    Text("Hydration data loading...")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(backgroundColor)
                } else {
                    List (viewModel.hydrations) { hydration in
                        let message = switch hydration.amount {
                        case 0..<2: "Keep hydrating!"
                        case 2..<4: "You're doing great!"
                        default: "water ninja!"
                        }
                        NavigationLink(
                            destination: BadgeView(rewardMessage: message,
                                                   id: hydration.id)
                        ) {
                            HydrationView(hydration: hydration)
                        }
                    }
                }
            }
            .background(backgroundColor)
            .scrollContentBackground(.hidden)
            .navigationTitle(Text("hydracco"))
            .task {
                await viewModel.loadData()
            }
        }
    }
}

#Preview {
    HydrationsView()
}
