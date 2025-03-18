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

    /// Moves this example app to plain old UIKit to showcase flutter integration
    @State private var showUIKit = false

    /// Passes the flutter dependency to that view for pigeon interaction
    @Environment(FlutterDependencies.self) var flutterDependencies

    @State private var pigeonHydration: String?
    @State private var showAlert = false

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

            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    Button("Open UIKit mode") {
                        showUIKit = true
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        Task {
                            await PigeonHydrationApi(binaryMessenger: flutterDependencies.flutterEngine.binaryMessenger).getHydrations { result in
                                switch result {
                                case .success(let hydrations):
                                    pigeonHydration = hydrations.first?.date ?? "-"
                                default: break
                                }
                            }
                        }
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }

            /// Opening the UIKit version
            .fullScreenCover(isPresented: $showUIKit) {
                BadgeView(hydration: Hydration(id: 31, date: Date(), amount: 1.5))
            }

            .alert(pigeonHydration ?? "message",
                   isPresented: $showAlert) {
                Button("OK", role: .cancel) {}
            }

            /// Telling the viewmodel to load hydrations
            .task {
                await viewModel.loadData()
            }
        }
    }
}

#Preview {
    HydrationsView().environment(FlutterDependencies())
}
