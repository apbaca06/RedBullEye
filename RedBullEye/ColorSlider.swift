//
//  ColorSlider.swift
//  RedBullEye
//
//  Created by  cindy on 2021/3/23.
//

import SwiftUI

struct ColorSlider: View {
    
    @Binding var value: Double
   var textColor: Color
    
    var body: some View {
        HStack {
            Text("0")
                .foregroundColor(textColor)
            Slider(value: $value)
                .background(textColor)
                .cornerRadius(10)
            Text("255")
                .foregroundColor(textColor)
        }.padding(.horizontal)
    }
}

struct ColorSlider_Preview: PreviewProvider {
    static var previews: some View {
        ColorSlider(value: .constant(0.2), textColor: .red)
    }
}
