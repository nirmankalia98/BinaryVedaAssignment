//
//  DashboardActionItems.swift
//  BinaryVeda
//
//  Created by Nirman Kalia on 23/03/23.
//

import SwiftUI

enum DashboardActionItemType: Identifiable {
    
    var id: String {
        return text
    }
    
    case upload
    case edit
    
    var asset: String {
        switch self {
        case .upload:
            return "uploadIcon"
        case .edit:
            return "editIcon"
        }
    }
    
    var text: String {
        switch self {
        case .upload:
            return "Upload"
        case .edit:
            return "Edit"
        }
    }
}

struct DashboardActionItem: View {
    let type: DashboardActionItemType
    let action: () -> Void
    var body: some View {
        Button {
            action()
        } label: {
            VStack {
                Image(type.asset)
                Text(type.text)
                    .typography(.label)
                    .foregroundColor(.primary)
            }
        }

    }
}
