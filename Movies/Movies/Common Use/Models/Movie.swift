//
//  Movie.swift
//  Movies
//
//  Created by Lucas Tavares on 18/12/19.
//  Copyright © 2019 Lucas Tavares. All rights reserved.
//

import Foundation

public struct Movie: Codable {
    let popularity: Double
    let voteCount: Int
    let video: Bool
    let posterPath: String
    let id: Int
    let adult: Bool
    let backdropPath: String?
    let originalLanguage: String
    let originalTitle: String
    let genreIds: [Int]
    let title: String
    let voteAverage: Double
    let overview: String
    let releaseDate: Date
}
