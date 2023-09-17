//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by sharonlhs on 17/09/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: isNight)
            VStack {
                CityTextView(cityName: "Cupertino, CA")
                
                MainWeatherStatusView(isNight: isNight,
                                      temperature: 76)
                
                HStack(spacing: 30) {
                    WeatherDayView(dayOfWeek: "TUE",
                                   imageName: "cloud.sun.fill",
                                   temperature: 74)
                    WeatherDayView(dayOfWeek: "WED",
                                   imageName: "sun.max.fill",
                                   temperature: 88)
                    WeatherDayView(dayOfWeek: "THURS",
                                   imageName: "wind.snow",
                                   temperature: 55)
                    WeatherDayView(dayOfWeek: "FRI",
                                   imageName: "sunset.fill",
                                   temperature: 60)
                    WeatherDayView(dayOfWeek: "SAT",
                                   imageName: "snow",
                                   temperature: 25)
                }
                Spacer()
                
                Button{
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Day Time",
                                  backgroundColour: isNight ? .gray : .white,
                                  textColour: isNight ? .white : .blue)
                    
                }
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack{
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .symbolRenderingMode(.palette)
                .resizable()
                .foregroundStyle(.white, .yellow)
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)°")
                .font(.system(size: 24, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    
    var isNight : Bool

    var body: some View {
//        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue,
//            isNight ? .gray : Color("lightBlue")]),
//            startPoint: .topLeading,
//            endPoint: .bottomTrailing)
//        .ignoresSafeArea()
        ContainerRelativeShape()
            .fill(isNight ? Color.black.gradient : Color.blue.gradient )
            .ignoresSafeArea()
    }
}

struct CityTextView: View {
    
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View {
    
    var isNight : Bool
    var temperature: Int
        
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: isNight ? "moon.stars.fill" :  "cloud.sun.fill")
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("\(temperature)°")
                .font(.system(size: 76, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}
