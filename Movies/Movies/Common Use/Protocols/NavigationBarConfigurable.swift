//
//  NavigationBarConfigurable.swift
//  Movies
//
//  Created by Lucas Tavares on 19/12/19.
//  Copyright © 2019 Lucas Tavares. All rights reserved.
//

import Foundation
import UIKit

protocol NavigationBarConfigurable: UIViewController {
    func setupNavigationBar(title: String, tintColor: UIColor, backgroundColor: UIColor)
}

extension NavigationBarConfigurable {
    func setupNavigationBar(title: String, tintColor: UIColor, backgroundColor: UIColor) {
        self.title = title
        self.navigationController?.navigationBar.barTintColor = backgroundColor
        self.navigationController?.navigationBar.tintColor = tintColor
        self.navigationController?.navigationBar.isOpaque = false
    }
}
