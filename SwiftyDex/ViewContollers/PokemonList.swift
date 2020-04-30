//
//  PokemonList.swift
//  SwiftyDex
//
//  Created by Rob on 4/7/20.
//  Copyright © 2020 Rob Gruen. All rights reserved.
//

import UIKit
import SQLite3

class PokemonList: UIViewController {
    
    var tableView = UITableView()
    var pokemonList = [Pokemon]()
    var db: OpaquePointer?
    
    struct Cells {
        static let pokemonCell = "PokemonCell"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        openDatabase()
        configureTableView()
        tableView.register(PokemonCell.self, forCellReuseIdentifier: Cells.pokemonCell)
        title = "SwiftyDex"
    }
    
    func openDatabase() {
        if let sqliteDBPath = Bundle.main.path(forResource: "pokedex", ofType: "sqlite", inDirectory: "") {
            // print(sqliteDBPath)
            guard sqlite3_open(sqliteDBPath, &db) == SQLITE_OK else {
                print("error opening database")
                sqlite3_close(db)
                db = nil
                return
            }
        }
        readValues()
    }
    
    func readValues(){
        pokemonList.removeAll()
        let query = """
            SELECT DISTINCT p.id, p.identifier, p.species_id, p.height, p.weight, p.base_experience,  p.is_default
            FROM pokemon p
            WHERE p.id != 10080
            AND p.id != 10081
            AND p.id != 10082
            AND p.id != 10083
            AND p.id != 10084
            AND p.id != 10085
            AND p.id != 10094
            AND p.id != 10095
            AND p.id != 10096
            AND p.id != 10097
            AND p.id != 10098
            AND p.id != 10099
            AND p.id != 10148
            ORDER BY p.species_id
        """
        var statementPointer: OpaquePointer?

        // Preparing the query
        if (sqlite3_prepare(db, query, -1, &statementPointer, nil) != SQLITE_OK) {
            let error = String(cString: sqlite3_errmsg(db)!)
            print("Error preparing query: \(error)")
            return
        }

        // Looping through the returned rows
        while (sqlite3_step(statementPointer) == SQLITE_ROW) {
            let id: Int = Int(sqlite3_column_int(statementPointer, 0))
            let identifier: String = String(cString: sqlite3_column_text(statementPointer, 1))
            let speciesID: Int = Int(sqlite3_column_int(statementPointer, 2))
            let height: Int = Int(sqlite3_column_int(statementPointer, 3))
            let weight: Int = Int(sqlite3_column_int(statementPointer, 4))
            let baseExperience: Int = Int(sqlite3_column_int(statementPointer, 5))
            let order: Int = Int(sqlite3_column_int(statementPointer, 6))
            let isDefault: Int = Int(sqlite3_column_int(statementPointer, 7))
            
            var newPokemon = Pokemon(id: id, identifier: identifier, speciesID: speciesID, height: height, weight: weight, baseExperience: baseExperience, order: order, isDefault: isDefault)
            
            let types = getTypes(pokemon: newPokemon)
            
            for (index, type) in types.enumerated() {
                if (index == 0) {
                    newPokemon.type1 = type
                } else if (index == 1) {
                    newPokemon.type2 = type
                }
            }
            
            // Creating a new Pokemon object with returned data
            pokemonList.append(newPokemon)
        }
    }
    
    func getTypes(pokemon: Pokemon) -> [String] {
        var statementPointer: OpaquePointer?
        
        let subquery = """
            SELECT tn.name
            FROM type_names tn
            INNER JOIN pokemon_types pt
            ON pt.type_id = tn.type_id
            WHERE local_language_id = 9
            AND pt.pokemon_id = \(pokemon.id)
        """
        
        if (sqlite3_prepare(db, subquery, -1, &statementPointer, nil) != SQLITE_OK) {
            let error = String(cString: sqlite3_errmsg(db)!)
            print("Error preparing query: \(error)")
        }
        
        var types: [String] = []
        while (sqlite3_step(statementPointer) == SQLITE_ROW) {
            let type: String = String(cString: sqlite3_column_text(statementPointer, 0))
            types.append(type)
        }
        return types
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        
        // Set delegate methods
        setTableViewDelegats()
        // Set row height
        tableView.rowHeight = 60
        // Register cells
        
        // Set constraints
        tableView.pin(to: view)
    }
    
    func setTableViewDelegats() {
        tableView.delegate = self
        tableView.dataSource = self
    }

    

    


//     MARK: - Navigation
//
//     In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }

}


extension PokemonList: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemonList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.pokemonCell) as! PokemonCell
        cell.set(pokemon: pokemonList[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
