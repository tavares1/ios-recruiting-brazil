//
//  MovieCollectionViewCell.swift
//  Movies
//
//  Created by Lucas Tavares on 18/12/19.
//  Copyright © 2019 Lucas Tavares. All rights reserved.
//

import UIKit

protocol MovieCollectionViewCellDelegate: class {
    func didFavoriteMovie()
}

final class MovieCollectionViewCell: UICollectionViewCell, ReuseIdentifying, ViewConfigurable {
    
    weak var delegate: MovieCollectionViewCellDelegate?
    
    private let movieImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .yellow
        return label
    }()
    
    private lazy var favoriteMovieButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(UIImage(named: "favorite_gray_icon"), for: .normal)
        button.setBackgroundImage(UIImage(named: "favorite_full_icon"), for: .highlighted)
        button.addTarget(self, action: #selector(shouldFavoriteMovie), for: .touchDown)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func shouldFavoriteMovie() {
        delegate?.didFavoriteMovie()
    }
    
    func buildViewHierarchy() {
         addSubviews(views: [movieImageView, titleLabel, favoriteMovieButton])
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            movieImageView.topAnchor.constraint(equalTo: topAnchor),
            movieImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            movieImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            movieImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.8)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: movieImageView.bottomAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            titleLabel.trailingAnchor.constraint(equalTo: favoriteMovieButton.leadingAnchor, constant: -8)
        ])
        
        NSLayoutConstraint.activate([
            favoriteMovieButton.heightAnchor.constraint(equalToConstant: 20),
            favoriteMovieButton.widthAnchor.constraint(equalToConstant: 20),
            favoriteMovieButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            favoriteMovieButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8)
        ])
    }
    
    func additionalViewConfiguration() {
        backgroundColor = UIColor(red: 45/255, green: 48/255, blue: 69/255, alpha:1)
    }
    
    func configure(viewModel: MovieViewModel) {
//        movieImageView.image = viewModel.imagePath
        titleLabel.text = viewModel.title
    }
}
