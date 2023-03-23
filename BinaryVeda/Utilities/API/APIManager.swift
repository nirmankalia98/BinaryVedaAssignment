//
//  APIManager.swift
//  BinaryVeda
//
//  Created by Nirman Kalia on 22/03/23.
//

import Foundation
import Combine

enum APIError: Error {
    case invalidResponse
    case invalidURL
    case invalidData
    case network(Error?)
}

typealias Handler<T> = (Result<T, APIError>) -> Void

final class APIManager {
    
    public static let shared = APIManager()
    private init() {}
    
    func request<T: Decodable>(
        modelType: T.Type,
        type: APIEndpoint,
        queryItems: [URLQueryItem]? = nil,
        completion: @escaping Handler<T>
    ) {
        guard let plainUrl = type.url else {
            completion(.failure(.invalidURL))
            return
        }
        var url = plainUrl
        if let queryItems = queryItems {
            url = plainUrl.appending(queryItems: queryItems)
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = type.method.name
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data, error == nil else {
                completion(.failure(.invalidData))
                return
            }
            if let error = error {
                completion(.failure(.network(error)))
                return
            }
            do {
                let products = try JSONDecoder().decode(modelType, from: data)
                completion(.success(products))
            }catch {
                completion(.failure(.invalidResponse))
            }
            
        }.resume()
    }
    
    static var commonHeaders: [String: String] {
        return [
            "Content-Type": "application/json"
        ]
    }
}
