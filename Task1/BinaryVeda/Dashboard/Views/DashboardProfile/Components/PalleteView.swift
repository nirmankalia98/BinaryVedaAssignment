//
//  PalleteView.swift
//  BinaryVeda
//
//  Created by Nirman Kalia on 23/03/23.
//

import SwiftUI

struct PalleteView: View {
    let colors: [String]
    var body: some View {
        ZStack {
            HStack(spacing: 0) {
                ForEach(colors, id: \.self) { color in
                    ZStack {
                        Color(hex: color)
                        if color == colors.first {
                            Text("pallete")
                                .typography(.heading)
                                .foregroundColor(.white)
                        }
                    }
                 
                }
            }
        }
        
    }
}
