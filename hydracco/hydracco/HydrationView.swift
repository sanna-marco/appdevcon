//
//  HydrationView.swift
//  hydracco
//
//  Created by Marco Sanna on 10.03.25.
//
import SwiftUI

struct HydrationView: View {
    let hydration: Hydration

    var body: some View {
        HStack {
            Text("\(hydration.amount.formatted(.number.rounded(increment: 0.01))) liters")
                .font(.custom("Impact", size: 25))
            Spacer()
            Text("\(hydration.date, style: .relative)")
        }
        .padding()
    }
}

#Preview {
    HydrationView(hydration: Hydration(id: 1, date: Calendar.current.date(byAdding: .day, value: -11, to: Date())!, amount: 2.34512))
}
