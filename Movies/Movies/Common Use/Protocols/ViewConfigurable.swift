//
//  ViewConfigurable.swift
//  Movies
//
//  Created by Lucas Tavares on 19/12/19.
//  Copyright © 2019 Lucas Tavares. All rights reserved.
//

import Foundation

protocol ViewConfigurable {
    func setupView()
    func buildViewHierarchy()
    func setupConstraints()
    func additionalViewConfiguration()
}

extension ViewConfigurable {
    func setupView() {
        buildViewHierarchy()
        setupConstraints()
        additionalViewConfiguration()
    }
    
    func additionalViewConfiguration() {
        
    }
}
