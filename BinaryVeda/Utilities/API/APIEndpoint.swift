//
//  EndpointType.swift
//  BinaryVeda
//
//  Created by Nirman Kalia on 22/03/23.
//

import Foundation

enum HTTPMethod {
    case get
    
    var name: String {
        switch self {
        case .get:
            return "GET"
        }
    }
}

protocol APIEndpoint {
    var path: String { get }
    var baseURL: String { get }
    var url: URL? { get }
    var method: HTTPMethod { get }
}

