//
//  ContentView.swift
//  SpiltUpProject
//
//  Created by Hung-Chun Tsai on 2021-01-08.
//

import SwiftUI

struct ContentView: View {
    @State private var name = ""

    var body: some View {
        Form {
            TextField("Enter your name", text: $name)
            Text("Hello World")
            //How to accese the property inline
            Text("Your name is \(name)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
