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
    @IBOutlet weak var mainImage: UIImageView!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    
    @IBOutlet weak var defenseLabel: UILabel!
    @IBOutlet weak var pokemonIDLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var baseAttackLabel: UILabel!
    
    @IBOutlet weak var evoLabel: UILabel!
    @IBOutlet weak var currentEvoImage: UIImageView!
    @IBOutlet weak var nextEvoImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = pokemon.name.capitalized
        pokemonIDLabel.text = "\(pokemon.pokeID)"
        
        let image = UIImage(named: "\(pokemon.pokeID)")
        mainImage.image = image
        currentEvoImage.image = image
        
        pokemon.downloadPokemonDetails {
            // Whatever we write will only be called
            // after the network call is complete
            
            self.updateUI()
        }
    }
    
    func updateUI() {
        defenseLabel.text = pokemon.defense
        weightLabel.text = pokemon.weight
        heightLabel.text = pokemon.height
        baseAttackLabel.text = pokemon.attack
        typeLabel.text = pokemon.type
        descriptionLabel.text = pokemon.description
        
        if pokemon.nextEvolutionID == "" {
            evoLabel.text = "No Evolution"
            nextEvoImage.isHidden = true
        } else {
            nextEvoImage.isHidden = false
            nextEvoImage.image = UIImage(named: pokemon.nextEvolutionID)
            let str = "Next Evolution \(pokemon.nextEvolutionName) - LVL \(pokemon.nextEvolutionLevel)"
            evoLabel.text = str
        }
    }

    @IBAction func backButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
