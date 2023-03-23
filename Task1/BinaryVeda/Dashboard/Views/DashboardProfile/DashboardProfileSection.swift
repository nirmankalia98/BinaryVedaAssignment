//
//  DashboardStats.swift
//  BinaryVeda
//
//  Created by Nirman Kalia on 22/03/23.
//

import SwiftUI

struct DashboardProfileSection: View {
    
    @StateObject var viewModel: ProfileViewModel
    @State var selectedActionItem: DashboardActionItemType?
    
    var userProfile: UserProfileEntity? { viewModel.userProfile }
    var userName: String { viewModel.userProfile?.userName ?? "nil" }
    var image: String { viewModel.userProfile?.profileImage ?? "nil" }
    var pallete: [String] { viewModel.userProfile?.pallete ?? ["FFFFFF"] }
    
    var body: some View {
        guard let userProfile = userProfile else {
            return Text("Something went wrong...")
                .typography(.info)
                .wrapAny()
        }
        return VStack {
            HStack {
                DashboardActionItem(type: .upload, action: {
                    self.selectedActionItem = .upload
                })

                VStack {
                    Image(image)
                        .resizable()
                        .aspectRatio( 1, contentMode: .fit)
                        .frame(height: 127)
                    Text(userName)
                        .typography(.largeTitle)
                }
                .padding(.horizontal, 40)
                
                DashboardActionItem(type: .edit, action: {
                    self.selectedActionItem = .edit
                })
            }
            
            HStack {
                Text("My Dashboard")
                    .typography(.label)
                Spacer()
                Toggle("", isOn: $viewModel.isDashboardVisible)
                    .toggleStyle(DashboardToggleStyle())
                    .aspectRatio(3, contentMode: .fit)
                    .frame(width: 60)

            }
            .padding(.horizontal, 40)
            .padding(.vertical, 10)
            
            if let user = userProfile, viewModel.isDashboardVisible {
                DashboardStats(userProfile: user)
            }
            
            PalleteView(colors: pallete)
                .frame(height: 42)
                .padding(.horizontal, .appMargin)
                .padding(.bottom, 20)
            
        }
        .sheet(item: $selectedActionItem, content: { item in
            Text("\(item.text)")
        })
        .wrapAny()
    }
}

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

struct DashboardProfileSection_Previews: PreviewProvider {
    static let vm = ProfileViewModel(profileService: MockUserDataService())
    static var previews: some View {
        DashboardProfileSection(viewModel: vm)
    }
}
