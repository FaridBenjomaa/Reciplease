//
//  FavoriteViewController.swift
//  Reciplease
//
//  Created by Farid Benjomaa on 18/07/2021.
//

import UIKit
import CoreData

class FavoriteViewController: UIViewController, NSFetchedResultsControllerDelegate{
    
    var recipes = Recipes.all
    var recipe : Recipes!
    var recipeLabel : String!
    var imageData : Data!
    var totalTime : Int!
    var url : String!
    var valueToPass : String!

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        recipes = Recipes.all
        tableView.reloadData()
    }
    
}

extension FavoriteViewController: UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier:  "FavoriteRecipeCell" ,for: indexPath ) as?
                PresentFavoriteRecipesListTableViewCell else {
            return UITableViewCell()
        }
        
        let recipe = recipes[indexPath.row]
        let recipeLabel = recipe.label
        let imageData = recipe.imageData
        let totalTime = recipe.totalTime
        
        cell.configure(labelNameText: recipeLabel!, imageDatas: imageData!, totalTime: Int(totalTime), timerlabel: cell.labelTime)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ShowRecipesViewController") as? ShowRecipesViewController
        
        let recipe = recipes[indexPath.row]
        vc!.url = recipe.url
        vc!.recipeLabel = recipe.label
        vc!.imageData = recipe.imageData
        vc!.ingredientsline = recipe.ingredientsList
        vc!.totalTime = Int(recipe.totalTime) 
 
        
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
}



extension FavoriteViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            let recipe = recipes[indexPath.row]
            AppDelegate.persistantContainer.viewContext.delete(recipe)
            recipes.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
            try? AppDelegate.persistantContainer.viewContext.save()
            
        }
    }
}



