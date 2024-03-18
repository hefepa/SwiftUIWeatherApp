//
//  ContentView.swift
//  WeatherSwiftUI
//
//  Created by WEMA on 31/12/2023.
//

import SwiftUI


struct ContentView: View {
    @State private var isNight = false
    var body: some View {
        ZStack{
            GradientView(start: isNight ? .yellow : .red, end: isNight ? .blue : .blue)
            
            VStack(spacing:70){
                Text("Cupertino, CA")
                    .font(.system(size: 30, weight: .medium, design: .default))
                    .foregroundColor(.white)
                    .padding(.top, 50)
                
                VStack{
                    Image(decorative: isNight ? "nightimage" : "cloudsun")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 180, height: 120)
                        .padding(.bottom)
                        
                    Text("76°")
                        .font(.system(size: 70, weight: .medium))
                        .foregroundColor(.white)
                }
                HStack(spacing: 20){
                    Weather(days: "TUE", image: "cloudsun", degree: "74°")
                    Weather(days: "WED", image: "cloudsun", degree: "70°")
                    Weather(days: "THU", image: "cloudsun", degree: "66°")
                    Weather(days: "FRI", image: "cloudsun", degree: "60°")
                    Weather(days: "SAT", image: "cloudsun", degree: "55°")
                }
                
                VStack{
                    Button{
                        isNight.toggle()
                    }label: {
                        Text("Change Time of Day")
                            .frame(width: 300, height: 50)
                            .font(.system(size: 20, weight: .bold, design: .default))
                            .background(.white)
                            .cornerRadius(10)
                            //.padding(.top)
                    }
                }
                Spacer()
            }
        }

    }
}

#Preview {
    ContentView()
}


struct Weather: View {
    var days: String
    var image: String
    var degree: String
    
    var body: some View {
        VStack{
            Text(days)
                .font(.system(size: 20, weight: .medium, design: .default))
                .foregroundColor(.white)
            
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 70)
            
            Text(degree)
                .font(.system(size: 20, weight: .medium, design: .default))
                .foregroundColor(.white)
        }
    }
}

struct GradientView: View {
    var start: Color
    var end: Color
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [start, end]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/)
            .ignoresSafeArea()
    }
}
