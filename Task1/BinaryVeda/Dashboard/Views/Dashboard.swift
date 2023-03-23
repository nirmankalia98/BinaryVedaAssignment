//
//  Dashboard.swift
//  BinaryVeda
//
//  Created by Nirman Kalia on 22/03/23.
//

import SwiftUI

struct Dashboard: View {
    
    var viewModel: DashboardViewModel
    
    var body: some View {
        
        let artworkVM = ArtworkViewModel(
            artowrkDataService: viewModel.artowrkService
        )
        
        let profileVM = ProfileViewModel(
            profileService: viewModel.profileService
        )
       return ScrollView(.vertical) {
            VStack {
                DashboardProfileSection(viewModel: profileVM)
                ArtworkTab(viewModel: artworkVM)
            }
            .padding(.top, 10)
        }
    }
}

struct Dashboard_Previews: PreviewProvider {
    
    static let vm = DashboardViewModel(artowrkService: MockArtworkService(), profileService: MockUserDataService())
    
    static var previews: some View {
        Dashboard(viewModel: vm)
    }
}
