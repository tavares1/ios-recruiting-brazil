//
//  UIView+Subviews.swift
//  Movies
//
//  Created by Lucas Tavares on 19/12/19.
//  Copyright © 2019 Lucas Tavares. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func addSubviews(views: [UIView]) {
        views.forEach({self.addSubview($0)})
    }
}
