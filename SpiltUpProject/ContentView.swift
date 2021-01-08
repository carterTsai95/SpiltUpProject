//
//  ContentView.swift
//  SpiltUpProject
//
//  Created by Hung-Chun Tsai on 2021-01-08.
//

import SwiftUI

struct ContentView: View {
    
    /*
     
     Note-
     In the TextField, Swift only accept the 'String' to store the text field values.
     That's the reason why we don't uese the 'Int' or 'Double' to write our 'checkAmount'.
        
     */
    
    @State private var checkAmount = ""
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 2

    let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalPerPerson : Double {
        
        // Mission: calculate the total per person at here.
        
        let peopleCount = Double(numberOfPeople + 2)
        
        let tipSelection = Double(tipPercentages[tipPercentage])
                
        let orderAmount = Double(checkAmount) ?? 0
        
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount

        
        return amountPerPerson
    }
    
    
    
    var body: some View {
        
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                }
                
                Picker("Number of people", selection: $numberOfPeople) {
                    ForEach(2 ..< 100) {
                        Text("\($0) people")
                    }
                }
                
                Section (header: Text("Amount per person")){
                    Text("$\(totalPerPerson, specifier: "%.2f")")
                }

                Section(header: Text("How much tip do you want to leave?")) {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0 ..< tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
            }
            .navigationBarTitle("WeSplit")
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
