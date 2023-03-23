//
//  Int+Extension.swift
//  BinaryVeda
//
//  Created by Nirman Kalia on 22/03/23.
//

import Foundation

public extension Int {
    func abbreviateNumber() -> String {
        if self < 1000 {
            return "\(self)"
        }

        if self < 1000000 {
            var n = Double(self);
            n = Double( floor(n/100)/10 )
            return "\(n.description)K"
        }

        var n = Double(self)
        n = Double( floor(n/100000)/10 )
        return "\(n.description)M"
    }
}
