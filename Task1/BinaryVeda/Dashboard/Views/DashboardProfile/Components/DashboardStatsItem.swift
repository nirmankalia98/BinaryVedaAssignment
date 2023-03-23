//
//  DashboardStatsItem.swift
//  BinaryVeda
//
//  Created by Nirman Kalia on 23/03/23.
//

import SwiftUI

struct DashboardStatsItem: View {
    var data: String
    var type: String
    var body: some View {
        VStack(spacing: 0){
            Text(data)
                .typography(.title)
//                .background(Co,lor.yellow)
            Text(type)
                .typography(.label)
        }
    }
}
