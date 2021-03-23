//
//  ContentView.swift
//  RedBullEye
//
//  Created by  cindy on 2021/3/23.
//

import SwiftUI

struct ContentView: View {
    
    let rTarget = Double.random(in: 0..<1)
    let gTarget = Double.random(in: 0..<1)
    let bTarget = Double.random(in: 0..<1)
    @State var rGuess: Double
    @State var gGuess: Double
    @State var bGuess: Double
    
    var body: some View {
        VStack {
            HStack {
                VStack {
                    Color(red: rTarget, green: gTarget, blue: bTarget)
                    Text("Match this color!")
                        .padding()
                }
                VStack {
                    Color(red: rGuess, green: gGuess, blue: bGuess)
                    Text("R:\(Int(rGuess * 255)) G:\(Int(gGuess * 255)) B:\(Int(bGuess * 255))")
                        .padding()
                }
            }
            Button(action: {}) {
                Text("Hit me!")
            }
            
            ColorSlider(value: $rGuess, textColor: .red )
            ColorSlider(value: $gGuess, textColor: .green )
            ColorSlider(value: $bGuess, textColor: .blue )
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(rGuess: 0.5, gGuess: 0.5, bGuess: 0.5)
            // Landscape
            .previewLayout(.fixed(width: 568, height: 320))
    }
}   
