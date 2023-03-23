//
//  DashboardSocialMediaItem.swift
//  BinaryVeda
//
//  Created by Nirman Kalia on 23/03/23.
//

import SwiftUI

enum SocialMediaIteraction {
    case like
    case view
    case share
    
    var asset: String {
        switch self {
        case .like:
            return "heart"
        case .view:
            return "click"
        case .share:
            return  "share"
        }
    }
}

struct DashboardSocialItem: View {
    var type: SocialMediaIteraction
    var text: String
    var body: some View {
        HStack {
            Image(type.asset)
                .resizable()
                .frame(width: 16, height: 16)
            Text(text)
                .typography(.info)
        }
    }
}
