//
//  AllMoviesViewControllerScene.swift
//  Movies
//
//  Created by Lucas Tavares on 19/12/19.
//  Copyright © 2019 Lucas Tavares. All rights reserved.
//

import Foundation
import UIKit

class AllMoviesViewControllerScene: UIView, ViewConfigurable {

    let interitemSpacing: CGFloat = 16
    let lineSpacing: CGFloat = 16
    
    public lazy var moviesCollectionView: UICollectionView = {
       let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumInteritemSpacing = self.interitemSpacing
        flowLayout.minimumLineSpacing = self.lineSpacing
       let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
       collectionView.translatesAutoresizingMaskIntoConstraints = false
       collectionView.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: MovieCollectionViewCell.reuseIdentifier)
       collectionView.delegate = self
       return collectionView
    }()
    
    convenience init(dataSource: AllMoviesDataSource) {
        self.init()
        moviesCollectionView.dataSource = dataSource
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildViewHierarchy() {
        addSubviews(views: [moviesCollectionView])
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            moviesCollectionView.topAnchor.constraint(equalTo: topAnchor),
            moviesCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            moviesCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            moviesCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func additionalViewConfiguration() {
        moviesCollectionView.backgroundColor = .white
    }
}

extension AllMoviesViewControllerScene: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemsInLine:CGFloat = 2
        let width = UIScreen.main.bounds.size.width - (interitemSpacing) * CGFloat(itemsInLine+1)
        return CGSize(width: floor(width/itemsInLine), height: self.frame.height * 0.3)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
    }
}
