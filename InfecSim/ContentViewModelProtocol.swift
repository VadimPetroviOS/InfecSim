//
//  ContentViewModelProtocol.swift
//  InfecSim
//
//  Created by Вадим on 25.03.2024.
//

import Foundation

protocol ContentViewModelProtocol: ObservableObject {
    func setNumberCirclesWide(_ diametr: Double) -> Int
    func setNumberCirclesHeight(_ diametr: Double) -> Int
}
