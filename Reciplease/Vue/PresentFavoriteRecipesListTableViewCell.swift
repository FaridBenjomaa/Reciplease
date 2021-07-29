//
//  PresentFavoriteRecipesListTableViewCell.swift
//  Reciplease
//
//  Created by Farid Benjomaa on 27/07/2021.
//

import UIKit
import CoreData

class PresentFavoriteRecipesListTableViewCell: UITableViewCell {

   
    @IBOutlet weak var labelTime: UILabel!
    @IBOutlet weak var imageRecipe: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    public func convertionTime(_ totalTime: Int, _ timerlabel : UILabel) {
        if totalTime > 60 {
            let totalHour = totalTime / 60
            let totalMinutes = totalTime - (totalHour * 60)
            labelTime.text = "\(totalHour) h \(totalMinutes) m"
        }else if totalTime == 0 {
            labelTime.text = " NA "
        }else{
            labelTime.text = "\(totalTime) m"
        }
    }
    
    func configure(labelNameText : String, imageDatas: Data, totalTime : Int, timerlabel: UILabel){
        
        label.text = " \(labelNameText)"
        convertionTime(totalTime, timerlabel)
        imageRecipe.contentMode = .scaleAspectFill
        imageRecipe.image = UIImage(data: imageDatas)
        
    }
    
}
