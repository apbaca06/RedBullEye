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
    @State var showAlert = false
    
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
            Button(action: {
                showAlert = true
            }) {
                Text("Hit me!")
            }.alert(isPresented: $showAlert, content: {
                Alert(title: Text("Your Score"), message: Text(String(computeScore())), dismissButton: nil)
            }).padding()
            
            ColorSlider(value: $rGuess, textColor: .red )
            ColorSlider(value: $gGuess, textColor: .green )
            ColorSlider(value: $bGuess, textColor: .blue )
        }
    }
    
    func computeScore() -> Int {
      let rDiff = rGuess - rTarget
      let gDiff = gGuess - gTarget
      let bDiff = bGuess - bTarget
      let diff = sqrt(rDiff * rDiff + gDiff * gDiff + bDiff * bDiff)
      return Int((1.0 - diff) * 100.0 + 0.5)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(rGuess: 0.5, gGuess: 0.5, bGuess: 0.5)
            // Landscape
            .previewLayout(.fixed(width: 568, height: 320))
    }
}   
