//
//  PokedexCell.swift
//  SwiftyDex
//
//  Created by Rob on 4/7/20.
//  Copyright © 2020 Rob Gruen. All rights reserved.
//

import UIKit

class PokedexCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: "PokemonCell")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
