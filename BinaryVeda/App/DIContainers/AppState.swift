//
//  AppState.swift
//  BinaryVeda
//
//  Created by Nirman Kalia on 23/03/23.
//

import Foundation
import Combine

protocol AppStateProtocol: AnyObject {
    var user: UserProfileEntity? {get set}
    var userRepository: UserProfileDataServiceProtocol {get set}
}

class AppState: AppStateProtocol, ObservableObject {
    
    @Published var user: UserProfileEntity?
    @Published var isShowingSheet = false
    @Published var selecteToolBarItem: ToolBarItem?
    var userRepository: UserProfileDataServiceProtocol
    var cancellabels = Set<AnyCancellable>()
    
    init(userRepository: UserProfileDataServiceProtocol) {
        self.userRepository = userRepository
        userRepository.fetch()
            .sink { profile in
                self.user = profile
            }
            .store(in: &cancellabels)
    }
    
    static func bootstrap() -> AppState {
        let userRepo = UserProfileDataService()
        return AppState(userRepository: userRepo)
    }
    
    deinit {
        cancellabels.forEach{ $0.cancel() }
    }
}
