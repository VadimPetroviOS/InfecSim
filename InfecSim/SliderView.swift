//
//  SliderView.swift
//  InfecSim
//
//  Created by Вадим on 25.03.2024.
//

import SwiftUI

struct SliderView: View {
    @State private var sliderValue: Double = 0.5
    
    var body: some View {
        VStack {
            Slider(value: $sliderValue, in: 0.0...1.0)
                .padding()
        }
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView()
    }
}
