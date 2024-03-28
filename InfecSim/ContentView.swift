//
//  ContentView.swift
//  InfecSim
//
//  Created by Вадим on 21.03.2024.
//

import SwiftUI

struct ContentView<ViewModel: ContentViewModelProtocol>: View {
    @StateObject
    private var viewModel: ViewModel
    
    // MARK: - Initializing View

    init(peopleCount: Int, infectionFactor: Int, T: DispatchTimeInterval) where ViewModel == ContentViewModel {
        _viewModel = StateObject(
            wrappedValue: ContentViewModel(
                peopleCount: peopleCount,
                infectionFactor: infectionFactor,
                T: T
            )
        )
    }
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    // Переход на 1 экран
                }) {
                    Image(systemName: "chevron.left")
                        .font(.headline)
                        .foregroundColor(.black)
                        .frame(width: 50, height: 50)
                        .background {
                            Circle()
                                .foregroundColor(.white)
                        }
                        .shadow(radius: 10)
                        .padding()
                }
                Spacer()
                Slider(value: $viewModel.diameter, in: 20.0...90.0, step: 10.0)
                    .padding()
            }
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack(spacing: 20) {
                    
                    ForEach(0 ..< viewModel.setNumberCirclesHeight(viewModel.diameter), id:\.self
                    ) { index in
                        
                        HStack {
                            ForEach(0 ..< 0 + viewModel.setNumberCirclesWide(viewModel.diameter), id:\.self) { i in
                                HStack {
                                    Button(action: {
                                        viewModel.tupleDictInfectedPeople["\(index)\(i)"] = (index, i)
                                        viewModel.peopleInfection(index, i)
                                        viewModel.massInfeсtion()
                                    }) {
                                        Image(systemName: "\(String(describing: index)).circle")
                                            .frame(width: viewModel.diameter, height: viewModel.diameter)
                                            .overlay(Circle())
                                            .foregroundColor(
                                                viewModel.infectedColor(index, i)
                                            )
                                    }
                                }
                            }
                        }
                        
                        
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(
            peopleCount: 100,
            infectionFactor: 1,
            T: DispatchTimeInterval.seconds(3)
        )
    }
}
