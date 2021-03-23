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
    
    /*
     You normally don't use @State variables in a reusable view—use @Binding or @ObservedObject instead.
     You should create a private @State var only if the view should own the data, like the highlighted property of Button.
     Think about whether the data should be owned by a parent view or by an external source.

     */
    @State var rGuess: Double
    @State var gGuess: Double
    @State var bGuess: Double
    @State var showAlert = false
    
    @ObservedObject var timer = TimeCounter()
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    VStack {
                        Color(red: rTarget, green: gTarget, blue: bTarget)
                        showAlert ? Text("R:\(Int(rTarget * 255)) G:\(Int(gTarget * 255)) B:\(Int(bTarget * 255))").padding() : Text("Match this color!").padding()
                    }
                    VStack {
                        ZStack {
                            Color(red: rGuess, green: gGuess, blue: bGuess)
                            Text(String(timer.counter))
                                .padding(.all, 5)
                                .background(Color.white)
                                .mask(Circle())
                                .foregroundColor(.black)
                        }
                        Text("R:\(Int(rGuess * 255)) G:\(Int(gGuess * 255)) B:\(Int(bGuess * 255))")
                            .padding()
                    }
                }
                Button(action: {
                    showAlert = true
                    timer.killTimer()
                }) {
                    Text("Hit me!")
                }.alert(isPresented: $showAlert, content: {
                    Alert(title: Text("Your Score"), message: Text(String(computeScore())), dismissButton: nil)
                }).padding()
                
                VStack {
                    ColorSlider(value: $rGuess, textColor: .red )
                    ColorSlider(value: $gGuess, textColor: .green )
                    ColorSlider(value: $bGuess, textColor: .blue )
                }
            }
        }
        .navigationBarTitle("")
        .environment(\.colorScheme, .dark)
        .navigationBarHidden(true)
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
