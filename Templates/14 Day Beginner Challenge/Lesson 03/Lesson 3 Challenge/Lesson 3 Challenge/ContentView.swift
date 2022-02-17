//
//  ContentView.swift
//  Lesson 3 Challenge
//
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        Text("Hello, world!")
            // These are the modifiers for the green background and white text
            .padding()
            .background(Color.green)
            .cornerRadius(10)
            .foregroundColor(Color.white)
            // These are the additional modifiers for the blue background
            .padding()
            .background(Color.blue)
            .cornerRadius(10)
        
            // Try removing each modifier and see what that does to the Text element! (If you see the "resume" button in the upper right corner of your canvas, click it to ensure that your preview canvas updates to code changes!)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
