//
//  URLSession+dataTask.swift
//  Movies
//
//  Created by Lucas Tavares on 18/12/19.
//  Copyright © 2019 Lucas Tavares. All rights reserved.
//

import Foundation

extension URLSession {
    func dataTask(with url: URL, result: @escaping(Result<(URLResponse,Data),Error>) -> Void) -> URLSessionTask {
        return dataTask(with: url) { (data, response, error) in
            if let error = error {
                result(.failure(error))
                return
            }
            guard let response = response, let data = data else {
                let error = NSError(domain: "Can't recieve response or data", code: 0, userInfo: nil)
                result(.failure(error))
                return
            }
            
            result(.success((response,data)))
        }
    }
}
