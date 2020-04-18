//
//  Pokemon.swift
//  SwiftyDex
//
//  Created by Rob on 4/7/20.
//  Copyright © 2020 Rob Gruen. All rights reserved.
//

import Foundation

struct Pokemon {
    let id: Int
    let identifier: String
    let speciesID: Int
    let height: Int
    let weight: Int
    let baseExperience: Int
    let order: Int
    let isDefault: Int
    var type1: String?
    var type2: String?
    
    init(id: Int, identifier: String, speciesID: Int, height: Int, weight: Int, baseExperience: Int, order: Int, isDefault: Int) {
        self.id = id
        self.identifier = identifier
        self.speciesID = speciesID
        self.height = height
        self.weight = weight
        self.baseExperience = baseExperience
        self.order = order
        self.isDefault = isDefault
    }
}
