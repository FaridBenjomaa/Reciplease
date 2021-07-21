//
//  PresentRecipesListTableView.swift
//  Reciplease
//
//  Created by Farid Benjomaa on 21/07/2021.
//

import UIKit

class PresentRecipesListTableViewCell: UITableViewCell {

   
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var ingredients: UILabel!
    
    @IBOutlet weak var background: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(labelNameText : String){
        labelName.text = labelNameText
    }

}
