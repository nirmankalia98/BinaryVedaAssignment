//
//  ArtworkRepository.swift
//  BinaryVeda
//
//  Created by Nirman Kalia on 22/03/23.
//

import Foundation
import Combine

enum ArtworkEndpoint {
    case photos
}

// base url https://jsonplaceholder.typicode.com/
extension ArtworkEndpoint: APIEndpoint {
    
    var path: String {
        switch self {
        case .photos:
            return "photos"
        }
    }
    
    var baseURL: String {
        "https://jsonplaceholder.typicode.com/"
    }
    
    var url: URL? {
        let url = URL(string: "\(baseURL)\(path)")
        return url
    }
    
    var method: HTTPMethod {
        switch self {
        case .photos:
            return .get
        }
    }
}

protocol ArtworkDataServiceProtocol {
    func fetch(query: [String: String]?) -> Future<[AlbumEntity], Error>
}

final class ArtworkDataService: ArtworkDataServiceProtocol {
    func fetch(query: [String : String]?) -> Future<[AlbumEntity], Error> {
        var queryItems: [URLQueryItem]  = []
        if let query = query {
            for (key, val) in query {
                queryItems.append(URLQueryItem(name: key, value: val))
            }
        }
        return Future { promise in
            APIManager.shared.request(
                modelType: [AlbumEntity].self,
                type: ArtworkEndpoint.photos,
                queryItems: queryItems
            ) { result in
                switch result {
                case .success(let albums):
                    promise(.success(albums))
                case .failure(let err):
                    promise(.failure(err))
                }
            }
        }
        
    }
}
