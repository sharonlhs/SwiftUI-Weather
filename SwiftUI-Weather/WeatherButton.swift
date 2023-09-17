//
//  WeatherButton.swift
//  SwiftUI-Weather
//
//  Created by sharonlhs on 17/09/2023.
//

import Foundation
import SwiftUI

struct WeatherButton: View {
    
    var title: String
    var backgroundColour: Color
    var textColour: Color
    
    var body: some View {
        Text(title)
            .frame(width: 280, height: 50)
            .background(backgroundColour.gradient)
            .foregroundColor(textColour)
            .font(.system(size: 20, weight: .bold, design: .default))
            .cornerRadius(10)

    }
}

struct Weatherbutton_Previews: PreviewProvider {
    static var previews: some View {
        WeatherButton(title: "Test Title",
                      backgroundColour: .blue,
                      textColour: .white)
    }
}

