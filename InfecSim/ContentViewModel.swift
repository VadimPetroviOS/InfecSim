//
//  ContentViewModel.swift
//  InfecSim
//
//  Created by Вадим on 25.03.2024.
//

import Foundation
import SwiftUI

final class ContentViewModel: ContentViewModelProtocol {
    
    @Published
    var tupleDictInfectedPeople: [String: (Int, Int)] = [:]
    
    @Published var diameter: Double = 50.0
    
    private var infectedDict: [String: Bool] = [:]
    
    // MARK: - Initialization
    
    var peopleCount: Int
    var infectionFactor: Int
    var T: Int
    
    init(
        peopleCount: Int,
        infectionFactor: Int,
        T: Int
    ) {
        self.peopleCount = peopleCount
        self.infectionFactor = infectionFactor
        self.T = T
    }
    
    func setNumberCirclesWide(_ diametr: Double) -> Int {
        return (Int(UIScreen.main.bounds.width)/Int(diametr)) - 1
    }
    
    func setNumberCirclesHeight(_ diametr: Double) -> Int {
        return self.peopleCount / (Int(UIScreen.main.bounds.width)/Int(diametr)) - 1
    }
    
    func infectedColor(_ row: Int, _ column: Int) -> Color {
        return tupleDictInfectedPeople.contains(where: { $0.value == (row, column) }) ? Color.red : Color.blue
    }
    
    func peopleInfection(_ row: Int, _ column: Int) {
        infectedDict["\(row)\(column)"] = true
        var array = arrayPotentiallyInfected(row, column)
        if infectionFactor > 3 && array.count <= 3 {
            infectionProcess(3, &array)
        } else {
            infectionProcess(infectionFactor, &array)
        }
    }
    
    private func arrayPotentiallyInfected(_ row: Int, _ column: Int) -> [(Int, Int)] {
        var array: [(Int, Int)] = []
        
        if row == 0 && (1...(setNumberCirclesWide(diameter) - 2)).contains(column) {
            array = [
                (row, column - 1),
                (row, column + 1),
                (row + 1, column - 1),
                (row + 1, column),
                (row + 1, column + 1)
            ]
        } else if row == (setNumberCirclesHeight(diameter) - 1) && (1...(setNumberCirclesWide(diameter) - 2)).contains(column) {
            array = [
                (row - 1, column - 1),
                (row - 1, column),
                (row - 1, column + 1),
                (row, column - 1),
                (row, column + 1),
            ]
        } else if (1...(setNumberCirclesHeight(diameter) - 2)).contains(row) && column == 0 {
            array = [
                (row - 1, column),
                (row - 1, column + 1),
                (row, column + 1),
                (row + 1, column),
                (row + 1, column + 1)
            ]
        } else if (1...(setNumberCirclesHeight(diameter) - 2)).contains(row) && column == (setNumberCirclesWide(diameter) - 1) {
            array = [
                (row - 1, column - 1),
                (row - 1, column),
                (row, column - 1),
                (row + 1, column - 1),
                (row + 1, column),
            ]
        } else if row == 0 && column == 0 {
            array = [
                (row, column + 1),
                (row + 1, column),
                (row + 1, column + 1)
            ]
        } else if row == 0 && column == (setNumberCirclesWide(diameter) - 1) {
            array = [
                (row, column - 1),
                (row + 1, column),
                (row + 1, column - 1),
            ]
        } else if row == (setNumberCirclesHeight(diameter) - 1) && column == 0 {
            array = [
                (row - 1, column),
                (row - 1, column + 1),
                (row, column + 1),
            ]
        } else if row == (setNumberCirclesHeight(diameter) - 1) && column == (setNumberCirclesWide(diameter) - 1) {
            array = [
                (row - 1, column - 1),
                (row - 1, column),
                (row, column - 1),
            ]
        } else {
            array = [
                (row - 1, column - 1),
                (row - 1, column),
                (row - 1, column + 1),
                (row, column - 1),
                (row, column + 1),
                (row + 1, column - 1),
                (row + 1, column),
                (row + 1, column + 1)
            ]
        }
        
        return array
    }
    
    private func infectionProcess(_ infectionFactor: Int, _ array: inout [(Int, Int)]) {
//        for _ in 1...infectionFactor {
//            let randomIndex = Int.random(in: 0..<array.count)
//            let randomPeople = array[randomIndex]
//            if infectedDict["\(randomPeople.0)\(randomPeople.1)"] == true {
//                array.remove(at: randomIndex)
//                continue
//            }
//            tupleDictInfectedPeople["\(randomPeople.0)\(randomPeople.1)"] = (randomPeople.0, randomPeople.1)
//            array.remove(at: randomIndex)
//        }
        var infectPeopleCount = 0
        while infectPeopleCount != infectionFactor {
            if array.count == 0 { break }
            let randomIndex = Int.random(in: 0..<array.count)
            let randomPeople = array[randomIndex]
            if infectedDict["\(randomPeople.0)\(randomPeople.1)"] == true {
                array.remove(at: randomIndex)
                continue
            }
            infectedDict["\(randomPeople.0)\(randomPeople.1)"] = true
            tupleDictInfectedPeople["\(randomPeople.0)\(randomPeople.1)"] = (randomPeople.0, randomPeople.1)
            array.remove(at: randomIndex)
            infectPeopleCount += 1
        }
    }
}


