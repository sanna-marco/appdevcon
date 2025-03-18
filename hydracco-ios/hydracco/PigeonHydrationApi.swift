//
//  PigeonHydrationApi.swift
//  hydracco
//
//  Created by Marco Sanna on 18.03.25.
//

import Flutter

/// Simple example of the roundtrip from Flutter to Swift
class PigeonHydrationApi {
    var flutterApi: PigeonHydrationApi

    init(binaryMessenger: FlutterBinaryMessenger) {
        flutterApi = PigeonHydrationApi(binaryMessenger: binaryMessenger)
    }

    func getHydrations(
        completion: @escaping (Result<[DtoHydration], PigeonError>) -> Void
    ) async {
        await flutterApi.getHydrations {
            completion($0)
        }
    }
}
