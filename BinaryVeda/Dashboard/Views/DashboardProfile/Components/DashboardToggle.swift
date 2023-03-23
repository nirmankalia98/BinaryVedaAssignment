//
//  DashboardToggle.swift
//  BinaryVeda
//
//  Created by Nirman Kalia on 23/03/23.
//

import SwiftUI

struct DashboardToggleStyle: ToggleStyle {
    var activeColor: Color = Color(hex: "44A33D")
 
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
 
            Spacer()
            GeometryReader { proxy in
                let halfHeight = proxy.size.height/2
                let toggleSpace = proxy.size.width/2 - halfHeight
                RoundedRectangle(cornerRadius: halfHeight)
                    .fill(configuration.isOn ? activeColor : Color(.systemGray5))
                    .overlay {
                        Circle()
                            .stroke(Color.white, lineWidth: halfHeight - halfHeight*0.3)
                            .padding(5)
                            .scaleEffect(CGSize(width: 1.5, height: 1.5))
                            .offset(x: configuration.isOn ? toggleSpace : -toggleSpace)
                            .shadow(radius: 5)

                    }
                    .onTapGesture {
                        withAnimation(.linear) {
                            configuration.isOn.toggle()
                        }
                    }
            }
        }
    }
}

struct DashboardToggle_Previews: PreviewProvider {
    @State static var toggle = true
    static var previews: some View {
        Toggle("", isOn: $toggle)
            .toggleStyle(DashboardToggleStyle())
            .aspectRatio(3, contentMode: .fit)
            .frame(width: 60)
    }
}
