//
//  Pokemon.swift
//  pokedex3
//
//  Created by Richard Rodriguez on 5/4/17.
//
//

import Foundation

class Pokemon {
    
    private var _name: String
    private var _pokeID: Int
    
    var name: String {
        return _name
    }
    
    var pokeID: Int {
        return _pokeID
    }
    
    init(name: String, pokeID: Int) {
        _name = name
        _pokeID = pokeID
    }
}
