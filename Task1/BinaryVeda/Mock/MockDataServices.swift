//
//  MockDataServices.swift
//  BinaryVeda
//
//  Created by Nirman Kalia on 22/03/23.
//

import Foundation
import Combine

class MockArtworkService: ArtworkDataServiceProtocol {
    func fetch(query: [String : String]?) -> Future<[AlbumEntity], Error> {
        return Future { promise in
            promise(.success([]))
        }
    }
}

class MockUserDataService: UserProfileDataServiceProtocol {
    func fetch() -> Just<UserProfileEntity> {
        return Just(UserProfileEntity.mockUser)
    }
    
}


extension UserProfileEntity {
    static var mockUser: UserProfileEntity = {
         let socials = SocialEngagement(likesCount: 120, shareCount: 2300, viewedCount: 4300)
         let mock = UserProfileEntity(
             userName: "John.Doe",
             followersCount: 2300,
             artowrkCount: 50,
             exhibitionCount: 21,
             socialInfo: socials,
             profileImage: "userImage",
             pallete: ["571844", "900D3E","C70039", "FF5733", "FFC300"]
         )
         return mock
     }()
}
