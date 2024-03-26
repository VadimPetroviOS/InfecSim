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
    
    @State private var diametr: Double = 50.0
    
    // MARK: - Initializing View

    init(peopleCount: Int) where ViewModel == ContentViewModel {
        _viewModel = StateObject(
            wrappedValue: ContentViewModel(peopleCount: peopleCount
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
                Slider(value: $diametr, in: 20.0...100.0, step: 10.0)
                    .padding()
            }
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack(spacing: 20) {
                    
                    ForEach(0 ..< viewModel.setNumberCirclesHeight(diametr), id:\.self
                    ) { index in
                        
                        HStack {
                            ForEach(index ..< index + viewModel.setNumberCirclesWide(diametr), id:\.self) { i in
                                HStack {
                                    Button(action: {
                                        // Действие при нажатии на кнопку
                                    }) {
                                        Image(systemName: "\(String(describing: index)).circle")
                                            .frame(width: diametr, height: diametr)
                                            .overlay(Circle())
                                    }
                                    //                        .buttonStyle(PlainButtonStyle())
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
            peopleCount: 100
        )
    }
}

// диаметр 50
// количество кругов 6

// изменение диаметра, приводит к уменьшению размеров кругов
// их количество растет или уменьшается в зависимоти от

// диаметр 50
// кругов 6
// димаетр 100
// кругов 3
// диаметр 25
// кругов 12

// diametr = 50
// количество кругов = ширина экрана делить на diametr - 1
// количество столбцов определяется = кол-во людей делить нацело на количество кругов
// и после идет прорисовка

//V слайдер должен изменять значение диаметра
// теперь нам нужны три параметра это диаметр
// идет пересчет количество кругов в строке и столбце
