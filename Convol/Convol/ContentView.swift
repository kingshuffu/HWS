//
//  ContentView.swift
//  Convol
//
//  Created by Ayo Shafau on 9/8/23.
//

import SwiftUI

struct ContentView: View {
    @State private var val = 0.0
    @State private var inputUnit = ""
    @State private var outputUnit = ""
    @FocusState private var valFocused: Bool
    
    
    let volumes = ["mL", "L", "Oz", "C", "P", "G"]
    
    var conversion: Double {
        let inputUnit = inputUnit
        let outputUnit = outputUnit
        
        let inputValue = val
        let baseValue: Double
        let finalValue: Double
        
        switch inputUnit {
        case "mL":
            baseValue = inputValue
        case "L":
            baseValue = inputValue * 1000
        case "Oz":
             baseValue = inputValue * 29.573
        case "C":
            baseValue = inputValue * 236.588
        case "P":
            baseValue = inputValue * 473.176
        case "G":
            baseValue = inputValue * 3785.41
        default:
            baseValue = 0
        }
        
        switch outputUnit {
        case "mL":
            finalValue = baseValue
        case "L":
            finalValue = baseValue / 1000
        case "Oz":
             finalValue = baseValue / 29.573
        case "C":
            finalValue = baseValue / 236.588
        case "P":
            finalValue = baseValue / 473.176
        case "G":
            finalValue = baseValue / 3785.41
        default:
            finalValue = 0
        }
        
        return finalValue
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Picker("Input Unit", selection: $inputUnit) {
                        ForEach(volumes, id: \.self) {
                            Text("\($0)")
                        }
                    } .pickerStyle(.segmented)
                    
                    TextField("Input Value", value: $val, format: .number).keyboardType(.decimalPad).focused($valFocused)
                } header: {
                    Text("Input Value")
                }
                
                Section {
                    Picker("Output Unit", selection: $outputUnit) {
                        ForEach(volumes, id: \.self) {
                            Text("\($0)")
                        }
                    } .pickerStyle(.segmented)
                    
                    Text(conversion, format: .number)
                } header: {
                    Text("Output value")
                }
            } .navigationTitle("ConVol").toolbar {
                ToolbarItemGroup(placement: .keyboard){
                    Spacer()
                    Button("Done"){
                        valFocused = false
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
