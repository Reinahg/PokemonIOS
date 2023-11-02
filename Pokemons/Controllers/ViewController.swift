//
//  ViewController.swift
//  Pokemons
//
//  Created by Valeria on 1/11/23.
//

import UIKit
import SDWebImage
import ProgressHUD

class ViewController: UIViewController {
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var imgPokemon: UIImageView!
    @IBOutlet weak var lblExperienceQuantity: UILabel!
    @IBOutlet weak var lblHabilities: UILabel!
    var pokemonsViewModel : PokemonsViewModel!
    var pokemon: Pokemon?
    
    private(set) var experienceQuantity: Int = 0 {
        didSet{
            self.updateLblExperience()
        }
    }
    
    private(set) var actualPokemon: Int = 25 {
        didSet{
            self.callToViewModelForUIUpdate()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        callToViewModelForUIUpdate()
    }
    
    func callToViewModelForUIUpdate(){
        ProgressHUD.animate(Constants.Texts.charging, .barSweepToggle)
        self.pokemonsViewModel = PokemonsViewModel()
        self.pokemonsViewModel.bindPokemonViewModelToController = {
            ProgressHUD.dismiss()
            self.pokemon = self.pokemonsViewModel.pokemonData
            self.updateUI(pokemonInfo: self.pokemonsViewModel.pokemonData)
        }
        
        self.pokemonsViewModel.showErrorToController = {
            ProgressHUD.dismiss()
            self.showErrorAlert()
        }
        
        self.pokemonsViewModel.callFuncToGetEmpData(idPokemon: actualPokemon)
    }
    
    func updateUI(pokemonInfo: Pokemon){
        lblName.text = pokemonInfo.name.capitalized
        if let imageUrl = pokemonInfo.sprites.front_default {
            imgPokemon.sd_setImage(with: URL(string: imageUrl))
        }
        lblHabilities.text = ""
        var abilitiesText = ""
        
        for ability in pokemonInfo.abilities {
            abilitiesText += "- " + ability.ability.name + "\n"
        }
        
        lblHabilities.text = abilitiesText
        experienceQuantity = pokemonInfo.base_experience
    }
    
    func showErrorAlert(){
        let alert = UIAlertController(title: "Alerta", message: "Ocurrió un error al obtener la información", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default){_ in 
            self.actualPokemon = 25
        })
        self.present(alert, animated: true, completion: nil)
    }
    
    func updateLblExperience(){
        lblExperienceQuantity.text = "\(experienceQuantity)"
    }
    
    @IBAction func btnPlus(_ sender: Any) {
        experienceQuantity += 1
    }
    
    @IBAction func btnMinus(_ sender: Any) {
        experienceQuantity -= 1
    }
    
    @IBAction func btnBefore(_ sender: Any) {
        actualPokemon -= 1
    }
    
    @IBAction func btnNext(_ sender: Any) {
        actualPokemon += 1
    }
}

