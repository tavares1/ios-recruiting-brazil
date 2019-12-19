//
//  ViewController.swift
//  Movies
//
//  Created by Lucas Tavares on 09/12/19.
//  Copyright © 2019 Lucas Tavares. All rights reserved.
//

import UIKit

class AllMoviesViewController: UIViewController, NavigationBarConfigurable {

    private var movies: [Movie] = [] {
        didSet {
            DispatchQueue.main.async {
                self.setupCollectionView()
            }
        }
    }

    private var dataSource: AllMoviesDataSource?
    private lazy var sceneView = AllMoviesViewControllerScene()
    
    override func loadView() {
        self.view = sceneView
    }
    
    override func viewDidLoad() {
		super.viewDidLoad()
        setupNavigationBar(title: "Movies", tintColor: .moviesYellow, backgroundColor: .moviesYellow)
        setupCollectionView()
        fetchMovies()
    }
    
    func fetchMovies() {
        NetworkClient.shared?.fetchMovies(from: .popular, result: { (result) in
            switch result {
            case .success(let movieResponse):
                self.movies = movieResponse.results
            case .failure(let error):
                print(error.localizedDescription)
            }
        })
    }
    
    
    func setupCollectionView() {
        dataSource = AllMoviesDataSource(movies: movies)
        sceneView.moviesCollectionView.dataSource = dataSource
    }
}
