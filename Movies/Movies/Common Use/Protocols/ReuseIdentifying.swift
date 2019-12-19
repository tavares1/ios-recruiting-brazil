//
//  ReuseIdentifying.swift
//  Movies
//
//  Created by Lucas Tavares on 19/12/19.
//  Copyright © 2019 Lucas Tavares. All rights reserved.
//

import Foundation

protocol ReuseIdentifying {
    static var reuseIdentifier: String { get }
}

extension ReuseIdentifying {
    static var reuseIdentifier: String {
        return String(describing: Self.self)
    }
}
