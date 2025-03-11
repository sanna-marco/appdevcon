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
        NavigationView {
            Group {
                if viewModel.hydrations.isEmpty {

                    /// Zero view - no hydrations yet
                    /// Here we would check for permission and load data from health
                    Text("Hydration data loading...")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(backgroundColor)
                } else {

                    /// List of hydrations
                    List(viewModel.hydrations) { hydration in

                        /// Passes the hydration to the badge view - there flutter is at the game
                        NavigationLink(destination: BadgeView(hydration: hydration)) {
                            HydrationView(hydration: hydration)
                        }
                    }
                }
            }
            .background(backgroundColor)
            .scrollContentBackground(.hidden)
            .navigationTitle(Text("hydracco"))

            /// Telling the viewmodel to load hydrations
            .task {
                await viewModel.loadData()
            }
        }
    }
}

#Preview {
    HydrationsView()
}
