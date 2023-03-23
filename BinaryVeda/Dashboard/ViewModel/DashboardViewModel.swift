//
//  DashboardViewModel.swift
//  BinaryVeda
//
//  Created by Nirman Kalia on 22/03/23.
//

import Foundation

class DashboardViewModel {
    let artowrkService: ArtworkDataServiceProtocol
    let profileService: UserProfileDataServiceProtocol
    
    init(artowrkService: ArtworkDataServiceProtocol, profileService: UserProfileDataServiceProtocol) {
        self.artowrkService = artowrkService
        self.profileService = profileService
    }
}
