//
//  Hydration.swift
//  hydracco
//
//  Created by Marco Sanna on 10.03.25.
//
import Foundation

/// Holds the datastructure of a hydration, currently identified
/// as amount of liters and a date
struct Hydration: Identifiable {
    let id: Int
    let date: Date
    let amount: Double
}
