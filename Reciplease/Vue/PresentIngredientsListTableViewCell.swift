//
//  PresentIngredientsListTableViewCell.swift
//  Reciplease
//
//  Created by Farid Benjomaa on 20/07/2021.
//

import UIKit

class PresentIngredientsListTableViewCell: UITableViewCell {

   
    @IBOutlet weak var tiret: UILabel!
    @IBOutlet weak var ingredientsListing: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(tirets: String, ingredient: String){
        tiret.text = tirets
        ingredientsListing.text = ingredient
    }

}
