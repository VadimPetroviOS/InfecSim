//
//  ContentView.swift
//  InfecSim
//
//  Created by Вадим on 21.03.2024.
//

import SwiftUI

struct ContentView: View {
    
    var peopleCount: Int
    var widthPeopleCount: Int
    var heightPeopleCount: Int
    var remainderPeopleCount: Int
    
    init(peopleCount: Int, widthPeopleCount: Int) {
        self.peopleCount = peopleCount
        self.widthPeopleCount = widthPeopleCount
        self.heightPeopleCount = peopleCount / widthPeopleCount
        self.remainderPeopleCount = peopleCount % widthPeopleCount
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack(spacing: 20) {
                
                ForEach(0 ..< heightPeopleCount, id:\.self
                ) { index in
                    
                    HStack {
                        ForEach(index ..< index + widthPeopleCount, id:\.self) { i in
                            HStack {
                                Button(action: {
                                    // Действие при нажатии на кнопку
                                }) {
                                    Image(systemName: "\(String(describing: index)).circle")
                                        .frame(width: 50, height: 50)
                                        .overlay(Circle())
                                }
        //                        .buttonStyle(PlainButtonStyle())
                            }
                        }
                    }
                    
                    
                }
                HStack() {
                    ForEach(0 ..< remainderPeopleCount, id:\.self
                    ) { i in
                        Button(action: {
                            // Действие при нажатии на кнопку
                        }) {
                            Image(systemName: "\(String(describing: index)).circle")
                                .frame(width: 50, height: 50)
                                .overlay(Circle())
                        }
//                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .padding(.bottom)
            }
            }
            }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(
            peopleCount: 100,
            widthPeopleCount: Int(UIScreen.main.bounds.width)/50 - 1
        )
    }
}
