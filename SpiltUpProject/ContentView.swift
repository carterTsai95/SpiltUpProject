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
                
        //The nil coalescing operator is used to ensure something does have a value, either by unwrapping its optional value or by providing a default.
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
                
                
                //Did you notice that $0 in there? That’s shorthand syntax for closure parameters, because we’re inside a closure. That’s the same reason we need the self in self.tipPercentages – we’re using closures extensively, even though you might not have noticed.
                
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

//Challenge
/*

1. Add a header to the third section, saying “Amount per person”
2. Add another section showing the total amount for the check – i.e., the original amount plus tip value, without dividing by the number of people.
3. Change the “Number of people” picker to be a text field, making sure to use the correct keyboard type.

 */

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
