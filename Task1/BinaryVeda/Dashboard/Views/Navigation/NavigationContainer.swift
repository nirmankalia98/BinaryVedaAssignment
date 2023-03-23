//
//  NavigationContainer.swift
//  BinaryVeda
//
//  Created by Nirman Kalia on 21/03/23.
//

import SwiftUI

struct NavigationContainer<Content: View>: View {
    @ViewBuilder var content: Content
    var body: some View {
        VStack {
            NavigationBar()
            content
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct NavigationContainer_Previews: PreviewProvider {
    static var previews: some View {
        NavigationContainer {
            Rectangle()
        }
    }
}
