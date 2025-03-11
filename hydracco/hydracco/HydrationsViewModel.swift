//
//  HydrationsViewModel.swift
//  hydracco
//
//  Created by Marco Sanna on 10.03.25.
//
import SwiftUI

/// Kind of a viewmodel for the hydrations view. On instantiation it creates a
/// random set of `Hydration` objects.
@Observable class HydrationsViewModel {
    var hydrations: [Hydration] = []

    func loadData() async {
        try? await Task.sleep(for: .milliseconds(500))
        hydrations = (1...30).map { index in
            Hydration(
                id: index,
                date: Calendar.current.date(byAdding: .day, value: -index, to: Date())!,
                amount: Double.random(in: 0...4)
            )
        }
    }
}
