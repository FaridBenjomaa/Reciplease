//
//  PresentFavoriteRecipesListTableViewCell.swift
//  Reciplease
//
//  Created by Farid Benjomaa on 27/07/2021.
//

import UIKit

class PresentFavoriteRecipesListTableViewCell: UITableViewCell {

    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var ingredients: UILabel!
    


    @IBOutlet weak var imageData: UIImageView!
    @IBOutlet weak var timerlabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
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
    
    func configure(labelNameText : String, imageDatas: Data, totalTime : Int, timerlabel: UILabel){
        
        labelName.text = " \(labelNameText)"
        convertionTime(totalTime, timerlabel)
        imageData.contentMode = .scaleAspectFill
        imageData.image = UIImage(data: imageDatas)
        
    }
    
}
