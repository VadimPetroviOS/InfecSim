//
//  ContentViewModelProtocol.swift
//  InfecSim
//
//  Created by Вадим on 25.03.2024.
//

import Foundation
import SwiftUI

protocol ContentViewModelProtocol: ObservableObject {
    var tupleDictInfectedPeople: [String: (Int, Int)] { get set }
    var diameter: Double { get set }
    func setNumberCirclesWide(_ diametr: Double) -> Int
    func setNumberCirclesHeight(_ diametr: Double) -> Int
    func infectedColor(_ row: Int, _ column: Int) -> Color
    func peopleInfection(_ row: Int, _ column: Int)
}
