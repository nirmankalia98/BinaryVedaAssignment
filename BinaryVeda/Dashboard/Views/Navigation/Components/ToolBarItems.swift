//
//  ToolBarItems.swift
//  BinaryVeda
//
//  Created by Nirman Kalia on 23/03/23.
//

import Foundation
import SwiftUI

struct ProfileToolBarItem: View {
    var body: some View {
        Image("userIcon")
            .aspectRatio(1, contentMode: .fit)
            .frame(width: 33, height: 33)
            .background(Color(hex: "D90034"))
            .cornerRadius(20)
            .padding(.horizontal, 10)
    }
}

struct DrawerToolBarItem: View {
    var body: some View {
        Image("drawer")
            .resizable()
            .aspectRatio(1, contentMode: .fit)
    }
}

struct AddNewToolBarItem: View {
    var body: some View {
        Image("add")
            .resizable()
            .aspectRatio(1, contentMode: .fit)    }
}

enum ToolBarItem: String, Identifiable {
    var id: String {
        return self.rawValue
    }
    
    case profile
    case drawer
    case addNew
}
