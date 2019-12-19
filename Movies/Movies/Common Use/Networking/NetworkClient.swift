//
//  NetworkClient.swift
//  Movies
//
//  Created by Lucas Tavares on 18/12/19.
//  Copyright © 2019 Lucas Tavares. All rights reserved.
//

import Foundation

public final class NetworkClient {
    
    internal let baseURL: URL
    internal let session = URLSession.shared
    private let apiKey = "9141ccfd7087a533244a280e7ac4b8fd"
    
    public enum APIServiceError: Error {
        case apiError
        case invalidEndpoint
        case invalidResponse
        case noData
        case decodeError
    }
    
    public enum Endpoint: String, CustomStringConvertible, CaseIterable {
        case nowPlaying
        case upcoming
        case popular
        case topRated
        public var description: String {
            switch self {
            case .nowPlaying:
                return "now_playing"
            case .topRated:
                return "top_rated"
            case .upcoming:
                return "upcoming"
            case .popular:
                return "popular"
            }
        }
    }
    
    private let jsonDecoder: JSONDecoder = {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-mm-dd"
        jsonDecoder.dateDecodingStrategy = .formatted(dateFormatter)
        return jsonDecoder
    }()
      
    public static let shared: NetworkClient? = {
       guard let url = URL(string: "https://api.themoviedb.org/3") else { return nil }
       return NetworkClient(baseURL: url)
    }()

    private init(baseURL: URL) {
        self.baseURL = baseURL
    }
    
    private func fetchResources<T:Decodable>(url: URL, completion: @escaping ((Result<T, APIServiceError>) -> Void)) {
        guard var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true) else {
            completion(.failure(.apiError))
            return
        }
        
        let queryItems = [URLQueryItem(name: "api_key", value: apiKey)]
        urlComponents.queryItems = queryItems
        
        guard let url = urlComponents.url else {
            completion(.failure(.invalidEndpoint))
            return
        }
        
        session.dataTask(with: url) { (result) in
            switch result {
            case .success(let response,let data):
                guard let statusCode = (response as? HTTPURLResponse)?.statusCode, 200..<299 ~= statusCode else {
                    completion(.failure(.invalidResponse))
                    return
                }
                do {
                    let values = try self.jsonDecoder.decode(T.self, from: data)
                    completion(.success(values))
                } catch {
                    completion(.failure(.decodeError))
                }
            case .failure(_):
                completion(.failure(.apiError))
            }
        }.resume()
    }
    
    public func fetchMovies(from endPoint: Endpoint, result: @escaping (Result<MoviesResponse, APIServiceError>) -> Void) {
        let movieURL = baseURL
        .appendingPathComponent("/movie")
        .appendingPathComponent(endPoint.rawValue)
        fetchResources(url: movieURL, completion: result)
    }
}
