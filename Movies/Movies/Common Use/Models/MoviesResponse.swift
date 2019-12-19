//
//  MoviesResponse.swift
//  Movies
//
//  Created by Lucas Tavares on 18/12/19.
//  Copyright © 2019 Lucas Tavares. All rights reserved.
//

import Foundation

public struct MoviesResponse: Codable {
    let page: Int
    let totalResults: Int
    let totalPages: Int
    let results: [Movie]
}
