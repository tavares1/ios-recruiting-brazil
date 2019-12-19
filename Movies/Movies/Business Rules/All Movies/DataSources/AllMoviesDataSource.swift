//
//  AllMoviesDataSource.swift
//  Movies
//
//  Created by Lucas Tavares on 19/12/19.
//  Copyright © 2019 Lucas Tavares. All rights reserved.
//

import Foundation
import UIKit

final class AllMoviesDataSource: NSObject, UICollectionViewDataSource {
    
    private var movies: [Movie]
    
    init(movies: [Movie]) {
        self.movies = movies
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.reuseIdentifier, for: indexPath) as? MovieCollectionViewCell else { return UICollectionViewCell() }
        let movie = movies[indexPath.row]
        cell.configure(viewModel: MovieViewModel(movie: movie))
        return cell
    }
}


