//
//  ColorUISlider.swift
//  RedBullEye
//
//  Created by  cindy on 2021/3/24.
//

import SwiftUI

struct ColorUISlider: UIViewRepresentable {
    
    var color: UIColor
    @Binding var value: Double
    
    func makeUIView(context: Self.Context) -> UISlider {
        let slider = UISlider(frame: .zero)
        slider.thumbTintColor = color
        slider.value = Float(value)
        slider.minimumTrackTintColor = UIColor.red.withAlphaComponent(0.2)
        slider.maximumTrackTintColor = UIColor.red.withAlphaComponent(0.8)
        slider.addTarget(context.coordinator, action: #selector(Coordinator.valueChanged(_:)), for: .valueChanged)
        return slider
    }
    
    /*
     SwiftUI -> UIKit
     When the UISlider receives a Double value from the SwiftUI view, it updates its Float value.
     */
    func updateUIView(_ uiView: UISlider, context: Self.Context) {
        uiView.value = Float(value)
    }
    
    /*
     If your view doesn't interact with other parts of your app, providing a coordinator is  unnecessary.
     */
    func makeCoordinator() -> Coordinator {
        Coordinator(value: $value)
    }
    
    // create a coordinator to keep your SwiftUI view ColorUISlider data in sync with the UIKit control UISlider data.
    class Coordinator: NSObject {
        
        // It’s a reference to the ColorUISlider value, which receives a reference to a @State variable value in ContentView. This Binding<Double> syntax for declaring a binding works better in this not-strictly- SwiftUI setting, but this might be a bug.
        var value: Binding<Double>
        
        init(value: Binding<Double>) {
            self.value = value
        }
        
        // The only thing Coordinator.valueChanged(_:) does is update the value of your SwiftUI view ColorUISlider with incoming data from the UIKit control UISlider.
        @objc func valueChanged(_ sender: UISlider) {
            value.wrappedValue = Double(sender.value)
        }
    }
    
}

struct ColorUISlider_Previews: PreviewProvider {
    static var previews: some View {
        ColorUISlider(color: .red, value: .constant(0.5))
    }
}

