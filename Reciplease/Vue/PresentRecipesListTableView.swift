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
    
    @IBOutlet weak var backgroundImage: UIImageView!
 
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var likeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    public func convertionTime(_ totalTime: Int, _ timerlabel : UILabel) {
        if totalTime > 60 {
            let totalHour = totalTime / 60
            let totalMinutes = totalTime - (totalHour * 60)
            timerlabel.text = "\(totalHour) h \(totalMinutes) m"
        }else if totalTime == 0 {
            timerlabel.text = " NA "
        }else{
            timerlabel.text = "\(totalTime) m"
        }
    }
    
    func configure(labelNameText : String, imageData: Data, totalTime : Int, dishType: [String], timerlabel: UILabel){
        
        labelName.text = " \(labelNameText)"
        convertionTime(totalTime, timerlabel)
        backgroundImage.contentMode = .scaleAspectFill
        backgroundImage.image = UIImage(data: imageData)
        ingredients.text = "\(dishType)"
    }
    
 
    
    
    
}
