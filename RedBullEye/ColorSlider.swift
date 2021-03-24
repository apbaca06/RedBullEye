//
//  ColorSlider.swift
//  RedBullEye
//
//  Created by  cindy on 2021/3/23.
//

import SwiftUI

struct ColorSlider: View {
    
    @Binding var value: Double
   var textColor: UIColor
    
    var body: some View {
        HStack {
            Text("0")
                .foregroundColor(Color(textColor))
            ColorUISlider(color: textColor, value: $value)
                .background(Color(textColor))
                .cornerRadius(10)
            Text("255")
                .foregroundColor(Color(textColor))
        }.padding(.horizontal)
    }
}

struct ColorSlider_Preview: PreviewProvider {
    static var previews: some View {
        ColorSlider(value: .constant(0.2), textColor: .red)
    }
}
