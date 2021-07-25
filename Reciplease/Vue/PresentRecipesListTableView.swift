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
    
    fileprivate func convertionTime(_ totalTime: Int) {
        if totalTime > 60 {
            let totalHour = totalTime / 60
            let totalMinutes = totalTime - (totalHour * 60)
            timerLabel.text = "\(totalHour) h \(totalMinutes) m"
        }else if totalTime == 0 {
            timerLabel.text = " NA "
        }else{
            timerLabel.text = "\(totalTime) m"
        }
    }
    
    func configure(labelNameText : String, imageData: Data, totalTime : Int){
        
        labelName.text = " \(labelNameText)"
        convertionTime(totalTime)
        backgroundImage.contentMode = .scaleAspectFill
        backgroundImage.image = UIImage(data: imageData)
        
    }
    
 
    
    
    
}
