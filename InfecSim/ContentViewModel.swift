//
//  ContentViewModel.swift
//  InfecSim
//
//  Created by Вадим on 25.03.2024.
//

import Foundation
import SwiftUI

final class ContentViewModel: ContentViewModelProtocol {
    
    // MARK: - Initialization

    var peopleCount: Int
    
    init(
        peopleCount: Int
    ) {
        self.peopleCount = peopleCount
    }
    
    func setNumberCirclesWide(_ diametr: Double) -> Int {
        return (Int(UIScreen.main.bounds.width)/Int(diametr)) - 1
    }
    
    func setNumberCirclesHeight(_ diametr: Double) -> Int {
        return self.peopleCount / (Int(UIScreen.main.bounds.width)/Int(diametr)) - 1
    }
}


