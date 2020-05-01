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
    var form: UILabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(name)
        addSubview(type1)
        addSubview(type2)
        addSubview(sprite)
        addSubview(form)
        
        setSpriteImageConstraints()
        setNameLabelConstraints()
        setType1LabelConstraints()
        setType2LabelConstraints()
        setFormLabelConstraints()
    }

    required init(coder aDecoder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
    }
    
    func set(pokemon: Pokemon) {
        name.text = pokemon.name
        let spriteName: String = String(pokemon.id) + "-sprite"
        sprite.image = UIImage(named: spriteName)
        type1.text = pokemon.type1
        setTypeLabelColor(label: type1)
        if let secondType = pokemon.type2 {
            type2.text = secondType
            setTypeLabelColor(label: type2)
        } else {
            // Clearing type 2 label if reusable cell previously had text in it
            type2.text = ""
        }
        if let pokemonForm = pokemon.form {
            form.text = pokemonForm
        } else {
            form.text = ""
        }
    }
    
    func setSpriteImageConstraints() {
        sprite.translatesAutoresizingMaskIntoConstraints = false
        sprite.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        sprite.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25).isActive = true
        sprite.heightAnchor.constraint(equalToConstant: 30).isActive = true
        sprite.widthAnchor.constraint(equalToConstant: 35).isActive = true
    }
    
    func setNameLabelConstraints() {
        name.translatesAutoresizingMaskIntoConstraints = false
        name.leadingAnchor.constraint(equalTo: sprite.trailingAnchor, constant: 20).isActive = true
        name.heightAnchor.constraint(equalToConstant: 40).isActive = true
        //name.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
    }
    
    func setType1LabelConstraints() {
        type1.translatesAutoresizingMaskIntoConstraints = false
        type1.leadingAnchor.constraint(equalTo: sprite.trailingAnchor, constant: 20).isActive = true
        type1.heightAnchor.constraint(equalToConstant: 80).isActive = true
        //type1.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
        type1.topAnchor.constraint(equalTo: topAnchor).isActive = true
    }
    
    func setType2LabelConstraints() {
        type2.translatesAutoresizingMaskIntoConstraints = false
        //type2.leadingAnchor.constraint(equalTo: sprite.trailingAnchor, constant: 100).isActive = true
        type2.leadingAnchor.constraint(equalTo: type1.trailingAnchor, constant: 20).isActive = true
        type2.heightAnchor.constraint(equalToConstant: 80).isActive = true
        //type2.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
        type2.topAnchor.constraint(equalTo: topAnchor).isActive = true
    }
    
    func setFormLabelConstraints() {
        form.translatesAutoresizingMaskIntoConstraints = false
        form.leadingAnchor.constraint(equalTo: name.trailingAnchor, constant: 10).isActive = true
        form.heightAnchor.constraint(equalToConstant: 40).isActive = true
        //form.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
        form.topAnchor.constraint(equalTo: topAnchor).isActive = true
        
    }
    
    func setTypeLabelColor(label: UILabel) {
        switch label.text {
            case "Normal":
                label.textColor = UIColor(hexValue: "a8a878")
            case "Fighting":
                label.textColor = UIColor(hexValue: "c03028")
            case "Flying":
                label.textColor = UIColor(hexValue: "a890f0")
            case "Poison":
                label.textColor = UIColor(hexValue: "a040a0")
            case "Ground":
                label.textColor = UIColor(hexValue: "e0c068")
            case "Rock":
                label.textColor = UIColor(hexValue: "b8a038")
            case "Bug":
                label.textColor = UIColor(hexValue: "a8b820")
            case "Ghost":
                label.textColor = UIColor(hexValue: "705898")
            case "Steel":
                label.textColor = UIColor(hexValue: "b8b8d0")
            case "Fire":
                label.textColor = UIColor(hexValue: "f08030")
            case "Water":
                label.textColor = UIColor(hexValue: "6890f0")
            case "Grass":
                label.textColor = UIColor(hexValue: "78C850")
            case "Electric":
                label.textColor = UIColor(hexValue: "f8d030")
            case "Psychic":
                label.textColor = UIColor(hexValue: "f85888")
            case "Ice":
                label.textColor = UIColor(hexValue: "98d8d8")
            case "Dragon":
                label.textColor = UIColor(hexValue: "7038f8")
            case "Dark":
                label.textColor = UIColor(hexValue: "705848")
            case "Fairy":
                label.textColor = UIColor(hexValue: "ee99ac")
            case "???":
                label.textColor = UIColor(hexValue: "68a090")
            case "Shadow":
                label.textColor = UIColor(hexValue: "705848")
            default:
                label.textColor = UIColor(hexValue: "a8a878")
        }
    }


}
