//
//  RecipesListViewController.swift
//  Reciplease
//
//  Created by Farid Benjomaa on 21/07/2021.
//

import UIKit

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
        return recipesData.label.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier:  "RecipeCell" ,for: indexPath ) as?
                PresentRecipesListTableViewCell else {
                     return UITableViewCell()
                }
        let recipe = recipesData.label[indexPath.row]
   
        cell.configure(labelNameText: recipe)
        
        return cell
    }
    
}
