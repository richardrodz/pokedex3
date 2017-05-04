//
//  Pokemon.swift
//  pokedex3
//
//  Created by Richard Rodriguez on 5/4/17.
//
//

import Foundation

class Pokemon {
    
    fileprivate var _name: String
    fileprivate var _pokeID: Int
    fileprivate var _description: String!
    fileprivate var _type: String!
    fileprivate var _defense: String!
    fileprivate var _height: String!
    fileprivate var _weight: String!
    fileprivate var _attack: String!
    fileprivate var _nextEvolutionText: String!
    
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
