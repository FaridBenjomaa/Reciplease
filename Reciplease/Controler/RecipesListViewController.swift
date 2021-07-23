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
        let recipe = recipesData.label[indexPath.row]
        let imageData = recipesData.imageData[indexPath.row]
   
        cell.configure(labelNameText: recipe, imageData: imageData)
        
        return cell
    }
    
 
   

    
 
}
