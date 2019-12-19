//
//  MovieViewModel.swift
//  Movies
//
//  Created by Lucas Tavares on 18/12/19.
//  Copyright © 2019 Lucas Tavares. All rights reserved.
//

import Foundation

final class MovieViewModel {
    
    private let movie: Movie
    
    public let title: String
    public let imagePath: String

    init(movie: Movie) {
        self.movie = movie
        self.title = movie.title
        self.imagePath = movie.posterPath
    }
}
