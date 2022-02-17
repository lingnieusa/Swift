//
//  ContentView.swift
//  L12 Challenge Solution
//
//  Created by Christopher Ching on 2020-12-15.
//

import SwiftUI

struct ContentView: View {
    
    @State var number = 0
    @State var shouldDecrease = false
    
    var body: some View {
        
        VStack {
            Text(String(number))
            .padding()
            
            Button("Click Me") {
                
                // Use the flag to determine which method to call
                if shouldDecrease == false {
                    increase()
                }
                else {
                    decrease()
                }
                // A little bit more advanced, but here's another way to write the above if statement:
                // shouldDecrease ? decrease() : increase()
                
                // See if we should toggle the flag
                if number > 50 {
                    shouldDecrease = true
                }
                else if number < 0 {
                    shouldDecrease = false
                }
                
            }
        }
    }
    
    // Increase the number by a random amount
    func increase() {
    
        let randAmount = Int.random(in: 1...10)
        number += randAmount
    }
    
    // Decrease the number by a random amount
    func decrease() {
        
        let randAmount = Int.random(in: 1...10)
        number -= randAmount
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
