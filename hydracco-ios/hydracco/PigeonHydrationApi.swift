//
//  PigeonHydrationApi.swift
//  hydracco
//
//  Created by Marco Sanna on 18.03.25.
//

import Flutter

/// Simple example of the roundtrip from Flutter to Swift
class PigeonHydrationApi {
    let flutterApi: FlutterHydrationRepository

    init(binaryMessenger: FlutterBinaryMessenger) {
        flutterApi = FlutterHydrationRepository(binaryMessenger: binaryMessenger)
    }

    func getHydrations(
        completion: @escaping (Result<[DtoHydration], PigeonError>) -> Void
    ) {
        flutterApi.getHydrations {
            completion($0)
        }
    }
}
