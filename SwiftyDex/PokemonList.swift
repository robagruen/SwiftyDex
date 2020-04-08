//
//  PokemonList.swift
//  SwiftyDex
//
//  Created by Rob on 4/7/20.
//  Copyright © 2020 Rob Gruen. All rights reserved.
//

import UIKit
import SQLite3

class PokemonList: UITableViewController {
    
    var pokemonList = [Pokemon]()
    var db: OpaquePointer?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "SwiftyDex"
        
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
        let query = "SELECT * FROM Pokemon"
        var statementPointer: OpaquePointer?

        //preparing the query
        if (sqlite3_prepare(db, query, -1, &statementPointer, nil) != SQLITE_OK) {
            let error = String(cString: sqlite3_errmsg(db)!)
            print("Error preparing query: \(error)")
            return
        }

        //traversing through all the records
        while (sqlite3_step(statementPointer) == SQLITE_ROW) {
            let id: Int = Int(sqlite3_column_int(statementPointer, 0))
            let identifier: String = String(cString: sqlite3_column_text(statementPointer, 1))
            let speciesID: Int = Int(sqlite3_column_int(statementPointer, 2))
            let height: Int = Int(sqlite3_column_int(statementPointer, 3))
            let weight: Int = Int(sqlite3_column_int(statementPointer, 4))
            let baseExperience: Int = Int(sqlite3_column_int(statementPointer, 5))
            let order: Int = Int(sqlite3_column_int(statementPointer, 6))
            let isDefault: Int = Int(sqlite3_column_int(statementPointer, 7))
            
            //adding values to list
            pokemonList.append(Pokemon(id: id, identifier: identifier, speciesID: speciesID, height: height, weight: weight, baseExperience: baseExperience, order: order, isDefault: isDefault))
        }
    }

    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemonList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        //let cell = tableView.dequeueReusableCell(withIdentifier: "PokemonCell", for: indexPath)
        cell.textLabel?.text = pokemonList[indexPath.row].identifier

        return cell
    }
    
    
    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
