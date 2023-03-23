//
//  ProfileViewModel.swift
//  BinaryVeda
//
//  Created by Nirman Kalia on 22/03/23.
//

import Foundation
import Combine

class ProfileViewModel: ObservableObject {
    
    let profileService: UserProfileDataServiceProtocol
    @Published var userProfile: UserProfileEntity?
    @Published var isDashboardVisible = true
    var cancellables = Set<AnyCancellable>()
    
    init(profileService: UserProfileDataServiceProtocol) {
        self.profileService = profileService
        fetchData()
    }
    
    private func fetchData() {
        self.profileService.fetch()
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { entity in
                self.userProfile = entity
            })
            .store(in: &cancellables)
    }
}
