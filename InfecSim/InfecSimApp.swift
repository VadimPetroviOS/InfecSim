//
//  InfecSimApp.swift
//  InfecSim
//
//  Created by Вадим on 21.03.2024.
//

import SwiftUI

@main
struct InfecSimApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(
                peopleCount: 100,
                infectionFactor: 1,
                T: DispatchTimeInterval.seconds(3)
            )
        }
    }
}
