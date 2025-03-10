//
//  HydrationsView.swift
//  hydracco
//
//  Created by Marco Sanna on 09.03.25.
//

import SwiftUI

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
                        HydrationView(hydration: hydration)
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
