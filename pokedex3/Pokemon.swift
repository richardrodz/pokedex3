//
//  Pokemon.swift
//  pokedex3
//
//  Created by Richard Rodriguez on 5/4/17.
//
//

import Foundation
import Alamofire

class Pokemon {
    
    fileprivate var _name: String
    fileprivate var _pokeID: Int
    fileprivate var _description: String!
    fileprivate var _type: String!
    fileprivate var _defense: String!
    fileprivate var _height: String!
    fileprivate var _weight: String!
    fileprivate var _attack: String!
    fileprivate var _nextEvolutionName: String!
    fileprivate var _nextEvolutionID: String!
    fileprivate var _nextEvolutionLevel: String!
    fileprivate var _nextEvolutionText: String!
    fileprivate var _pokemonURL: String
    
    var name: String {
        return _name
    }
    
    var pokeID: Int {
        return _pokeID
    }
    
    var description: String {
        if _description == nil {
            _description = ""
        }
        return _description
    }
    
    var type: String {
        if _type == nil {
            _type = ""
        }
        return _type
    }
    
    var defense: String {
        if _defense == nil {
            _defense = ""
        }
        return _defense
    }
    
    var height: String {
        if _height == nil {
            _height = ""
        }
        return _height
    }
    
    var weight: String {
        if _weight == nil {
            _weight = ""
        }
        return _weight
    }
    
    var attack: String {
        if _attack == nil {
            _attack = ""
        }
        return _attack
    }
    
    var nextEvolutionName: String {
        if _nextEvolutionName == nil {
            _nextEvolutionName = ""
        }
        return _nextEvolutionName
    }
    
    var nextEvolutionID: String {
        if _nextEvolutionID == nil {
            _nextEvolutionID = ""
        }
        return _nextEvolutionID
    }
    
    var nextEvolutionLevel: String {
        if _nextEvolutionLevel == nil {
            _nextEvolutionLevel = ""
        }
        return _nextEvolutionLevel
    }
    
    var nextEvolutionText: String {
        if _nextEvolutionText == nil {
            _nextEvolutionText = ""
        }
        return _nextEvolutionText
    }
    
    init(name: String, pokeID: Int) {
        _name = name
        _pokeID = pokeID
        
        _pokemonURL = "\(URL_BASE)\(URL_POKEMON)\(pokeID)/"
    }
    
    func downloadPokemonDetails(complete: @escaping DownloadComplete) {
        Alamofire.request(_pokemonURL).responseJSON { (response) in
        
            if let dict = response.result.value as? Dictionary<String, AnyObject> {
                if let weight = dict["weight"] as? String {
                    self._weight = weight
                }
                
                if let height = dict["height"] as? String {
                    self._height = height
                }
                
                if let attack = dict["attack"] as? Int {
                    self._attack = "\(attack)"
                }
                
                if let defense = dict["defense"] as? Int {
                    self._defense = "\(defense)"
                }
                
                if let types = dict["types"] as? [Dictionary<String, String>] , types.count > 0 {
                    if let name = types[0]["name"] {
                        self._type = name.capitalized
                    }
                    
                    if types.count > 1 {
                        for x in 1..<types.count {
                            if let name = types[x]["name"] {
                                self._type! += "/\(name.capitalized)"
                            }
                        }
                    }
                } else {
                    self._type = ""
                }
                
                if let descArr = dict["descriptions"] as? [Dictionary<String, String>], descArr.count > 0 {
                    if let url = descArr[0]["resource_uri"] {
                        let descURL = "\(URL_BASE)\(url)"
                        Alamofire.request(descURL).responseJSON(completionHandler: { (response) in
                            if let descDict = response.result.value as? Dictionary<String, AnyObject> {
                                if let description = descDict["description"] as? String {
                                    let newDescription = description.replacingOccurrences(of: "POKMON", with: "Pokémon")
                                    self._description = newDescription
                                    print(self._description)
                                }
                            }
                            complete()
                        })
                    }
                } else {
                    self._description = ""
                }
                
                if let evolutions = dict["evolutions"] as? [Dictionary<String, AnyObject>] , evolutions.count > 0 {
                    if let nextEvolution = evolutions[0]["to"] as? String {
                        if nextEvolution.range(of: "mega") == nil {
                            self._nextEvolutionName = nextEvolution
                            
                            if let uri = evolutions[0]["resource_uri"] as? String {
                                let newStr = uri.replacingOccurrences(of: "/api/v1/pokemon/", with: "")
                                let nextEvoLevel = newStr.replacingOccurrences(of: "/", with: "")
                                self._nextEvolutionID = nextEvoLevel
                            }
                            
                            if let lvlExist = evolutions[0]["level"] {
                                
                                if let level = lvlExist as? Int {
                                    self._nextEvolutionLevel = "\(level)"
                                } else {
                                    self._nextEvolutionLevel = ""
                                }
                            }
                        }
                    }
                }
             }
            
            complete()
        }
    }
}
