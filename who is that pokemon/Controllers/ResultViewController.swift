//
//  ResultViewController.swift
//  who is that pokemon
//
//  Created by David De la Hoz on 24/06/24.
//

import UIKit
import Kingfisher

class ResultViewController: UIViewController {
    
    @IBOutlet weak var pokemonImage: UIImageView!
    @IBOutlet weak var pokemonLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var resultPokemonLabel: String = ""
    var pokemonImageURL: String = ""
    var resultScoreLabel: String = ""
    
    
    lazy var game = GameModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scoreLabel.text = resultScoreLabel
        pokemonLabel.text = resultPokemonLabel
        pokemonImage.kf.setImage(with: URL(string: pokemonImageURL))
    }
    
    @IBAction func playAgainPressed(_ sender: UIButton) {
        self.dismiss(animated: true)
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
