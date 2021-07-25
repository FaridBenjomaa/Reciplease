//
//  IngredientsLineTableViewCell.swift
//  Reciplease
//
//  Created by Farid Benjomaa on 25/07/2021.
//

import UIKit

class IngredientsLineTableViewCell: UITableViewCell {

    
    @IBOutlet weak var tirets: UILabel!
    @IBOutlet weak var ingredients: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(tiret: String, ingredient: String){
        tirets.text = tiret
        ingredients.text = ingredient
    }


}
