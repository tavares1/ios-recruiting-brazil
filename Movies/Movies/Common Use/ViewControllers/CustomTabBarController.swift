//
//  CustomTabBarController.swift
//  Movies
//
//  Created by Lucas Tavares on 09/12/19.
//  Copyright © 2019 Lucas Tavares. All rights reserved.
//

import Foundation
import UIKit

class CustomTabBarController: UITabBarController {
	
	override func viewDidLoad() {
		configureTabBarItems()
//        tabBar.isTranslucent = false
        tabBar.barTintColor = UIColor.moviesYellow
        tabBar.tintColor = .black
	}
	
	func configureTabBarItems() {
		let allMoviesViewController =
		UINavigationController(rootViewController: AllMoviesViewController())
		
		allMoviesViewController.tabBarItem = UITabBarItem(title: "Movies", image: UIImage(named: "list_icon"), tag: 0)
		
		let favoritedMoviesViewController = UINavigationController(rootViewController: FavoritedMoviesViewController())
		
		favoritedMoviesViewController.tabBarItem = UITabBarItem(title: "Favorites", image: UIImage(named: "favorite_empty_icon"), selectedImage: UIImage(named: "favorite_full_icon"))
		
		viewControllers = [allMoviesViewController, favoritedMoviesViewController]
	}
	
}
