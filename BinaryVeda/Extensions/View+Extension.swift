//
//  View+Extension.swift
//  BinaryVeda
//
//  Created by Nirman Kalia on 23/03/23.
//

import Foundation
import SwiftUI

public extension View {
    @ViewBuilder func wrapAny() -> AnyView {
        AnyView(self)
    }
}

