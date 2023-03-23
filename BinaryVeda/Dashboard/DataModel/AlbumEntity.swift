//
//  AlbumEntity.swift
//  BinaryVeda
//
//  Created by Nirman Kalia on 22/03/23.
//

import Foundation

struct AlbumEntity: Decodable {
    let albumId, id: Int
    let title: String
    let url, thumbnailUrl: String
}
