//
//  PokedexCell.swift
//  SwiftyDex
//
//  Created by Rob on 4/7/20.
//  Copyright © 2020 Rob Gruen. All rights reserved.
//

import UIKit

class PokemonCell: UITableViewCell {
    
    var name: UILabel = UILabel()
    var type1: UILabel = UILabel()
    var type2: UILabel = UILabel()
    var sprite: UIImageView = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(name)
        addSubview(type1)
        addSubview(type2)
        addSubview(sprite)
        
        setSpriteImageConstraints()
        setNameLabelConstraints()
        setType1LabelConstraints()
        setType2LabelConstraints()
    }

    required init(coder aDecoder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
    }
    
    func set(pokemon: Pokemon) {
        name.text = pokemon.identifier.capitalized
        let spriteName: String = String(pokemon.id) + "-sprite"
        sprite.image = UIImage(named: spriteName)
        type1.text = pokemon.type1
        setTypeLabelColor(label: type1)
        if let secondType = pokemon.type2 {
            type2.text = secondType
            setTypeLabelColor(label: type2)
        }
    }
    
    func setSpriteImageConstraints() {
        sprite.translatesAutoresizingMaskIntoConstraints = false
        sprite.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        sprite.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        sprite.heightAnchor.constraint(equalToConstant: 45).isActive = true
        sprite.widthAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    func setNameLabelConstraints() {
        name.translatesAutoresizingMaskIntoConstraints = false
        //name.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        name.leadingAnchor.constraint(equalTo: sprite.trailingAnchor, constant: 20).isActive = true
        name.heightAnchor.constraint(equalToConstant: 40).isActive = true
        name.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
    }
    
    func setType1LabelConstraints() {
        type1.translatesAutoresizingMaskIntoConstraints = false
        //type1.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        type1.leadingAnchor.constraint(equalTo: sprite.trailingAnchor, constant: 20).isActive = true
        type1.heightAnchor.constraint(equalToConstant: 80).isActive = true
        type1.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
        type1.topAnchor.constraint(equalTo: topAnchor).isActive = true
    }
    
    func setType2LabelConstraints() {
        type2.translatesAutoresizingMaskIntoConstraints = false
        //type2.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        type2.leadingAnchor.constraint(equalTo: type1.trailingAnchor, constant: 20).isActive = true
        type2.heightAnchor.constraint(equalToConstant: 80).isActive = true
        type2.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
        type2.topAnchor.constraint(equalTo: topAnchor).isActive = true
    }
    
    func setTypeLabelColor(label: UILabel) {
        switch label.text {
            case "Normal":
                label.textColor = UIColor.white
            case "Fighting":
                label.textColor = UIColor.red
            case "Flying":
                label.textColor = UIColor.purple
            case "Poison":
                label.textColor = UIColor.purple
            case "Ground":
                label.textColor = UIColor.brown
            case "Rock":
                label.textColor = UIColor.brown
            case "Bug":
                label.textColor = UIColor.yellow
            case "Ghost":
                label.textColor = UIColor.purple
            case "Steel":
                label.textColor = UIColor.white
            case "Fire":
                label.textColor = UIColor.orange
            case "Water":
                label.textColor = UIColor.blue
            case "Grass":
                label.textColor = UIColor.green
            case "Electric":
                label.textColor = UIColor.yellow
            case "Psychic":
                label.textColor = UIColor.systemPink
            case "Ice":
                label.textColor = UIColor.green
            case "Dragon":
                label.textColor = UIColor.purple
            case "Dark":
                label.textColor = UIColor.purple
            case "Fairy":
                label.textColor = UIColor.systemPink
            case "???":
                label.textColor = UIColor.white
            case "Shadow":
                label.textColor = UIColor.white
            default:
                label.textColor = UIColor.white
        }
    }


}
