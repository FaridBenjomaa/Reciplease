//
//  RecipesListViewController.swift
//  Reciplease
//
//  Created by Farid Benjomaa on 21/07/2021.
//

import UIKit
import Alamofire

class RecipesListViewController: UIViewController {

    var recipesData: RecipesData!
    var recipeLabel : String!
    var imageData : Data!
    var totalTime : Int!
    var url : String!
    var valueToPass : String!
   
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
}

extension RecipesListViewController : UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipesData.imageData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier:  "RecipeCell" ,for: indexPath ) as?
                PresentRecipesListTableViewCell else {
                     return UITableViewCell()
                }
     
        recipeLabel = recipesData.label[indexPath.row]
        imageData = recipesData.imageData[indexPath.row]
        totalTime = recipesData.totalTime[indexPath.row]
        let dishType = recipesData.dishType[indexPath.row] 

        cell.configure(labelNameText: recipeLabel, imageData: imageData, totalTime: totalTime, dishType: dishType, timerlabel: cell.timerLabel)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ShowRecipesViewController") as? ShowRecipesViewController
        vc!.url = recipesData.url[indexPath.row]
        vc!.recipeLabel = recipesData.label[indexPath.row]
        vc!.imageData = recipesData.imageData[indexPath.row]
        vc!.ingredientsline = recipesData.ingredientsline[indexPath.row]
        vc!.totalTime = recipesData.totalTime[indexPath.row]
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}
