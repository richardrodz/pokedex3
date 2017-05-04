//
//  PokemonDetailsViewController.swift
//  pokedex3
//
//  Created by Richard Rodriguez on 5/4/17.
//
//

import UIKit

class PokemonDetailsViewController: UIViewController {

    var pokemon: Pokemon!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = pokemon.name
    }

}
