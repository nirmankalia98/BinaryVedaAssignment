//
//  UserProfileRepository.swift
//  BinaryVeda
//
//  Created by Nirman Kalia on 22/03/23.
//

import Foundation
import Combine

protocol UserProfileDataServiceProtocol: AnyObject {
    func fetch() -> Just<UserProfileEntity>
}

final class UserProfileDataService: UserProfileDataServiceProtocol {
    
    func fetch() -> Just<UserProfileEntity> {
        return Just(UserProfileEntity.mockUser)
    }
}
