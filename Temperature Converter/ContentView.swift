//
//  ContentView.swift
//  Temperature Converter
//
//  Created by Ayleen on 14.09.23.
//

import SwiftUI
import temperatureConverter

struct ContentView: View {
    var tempConv = TemperatureConverter()
    @State private var inputTemp: String = ""
    @State private var resultTemp: String = ""
    
    var body: some View {
        VStack(spacing: 20) {
            
            Text("Convert Celsius to Fahrenheit")
                .font(.title)
            
            TextField("Enter a number", text: $inputTemp)
                .keyboardType(.numberPad)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray, lineWidth: 1)
                )
            
            
            Button("Convert") {
                convertTemperature()
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
            
            TextField("Result", text: $resultTemp)
                .disabled(true) // So user cannot edit it directly
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray, lineWidth: 1)
                )
            Spacer()
        }
        .padding()
    }
    
    func convertTemperature() {
        if let celsius = Double(inputTemp) {
            let fahrenheit = tempConv.celsiusToFahrenheit(celsius: celsius)
            resultTemp = String(fahrenheit)
        } else {
            resultTemp = "Invalid input"
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
