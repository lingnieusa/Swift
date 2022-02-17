//
//  ContentView.swift
//  war-challenge
//
//  Created by ling nie on 2/16/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Image("background").ignoresSafeArea()
            VStack {
                Spacer()
                Image("logo")
                Spacer()
                HStack{
                    Spacer()
                    Image("card2")
                    Spacer()
                    Image("card3")
                    Spacer()
                }
                Spacer()
                Button(action: {print("hello")}, label: {
                    HStack {
                        Image(systemName: "pencil")
                        Text("Button")
                        Image("dealbutton")
                    }
                    
                })


                Spacer()
                HStack{
                    Spacer()
                    VStack{
                        Text("Player")
                            .foregroundColor(Color.white)
                            .padding(.bottom)
                        Text("0")
                            .foregroundColor(Color.white)
                    }
                    Spacer()
                    VStack{
                        
                        Text("CPU")
                            .foregroundColor(Color.white)
                            .padding(.bottom)
                        Text("0")
                            .foregroundColor(Color.white)
                    }
                    Spacer()
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
