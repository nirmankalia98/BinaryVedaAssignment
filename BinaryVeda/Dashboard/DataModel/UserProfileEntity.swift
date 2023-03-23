//
//  UserProfileEntity.swift
//  BinaryVeda
//
//  Created by Nirman Kalia on 22/03/23.
//

import Foundation

struct UserProfileEntity: Codable {
    let userName: String
    let followersCount: Int
    let artowrkCount: Int
    let exhibitionCount: Int
    let socialInfo: SocialEngagement?
    let profileImage: String?
    let pallete: [String]
}

struct SocialEngagement: Codable {
    var likesCount: Int?
    var shareCount: Int?
    var viewedCount: Int?
}
