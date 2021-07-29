//
//  ShowFavoriteRecipesViewController.swift
//  Reciplease
//
//  Created by Farid Benjomaa on 28/07/2021.
//

import UIKit

class ShowFavoriteRecipesViewController: UIViewController {

    var recipes = Recipes.all
    var indexRow : Int!
    
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        image.image = UIImage(data: recipes[indexRow].imageData!)
        label.text = recipes[indexRow].label
        timerLabel.text = String(recipes[indexRow].totalTime)
    }
    
}

extension ShowFavoriteRecipesViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes[indexRow].ingredientsLine!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier:  "favoriteIngredientsLineCell" ,for: indexPath ) as?
                FavoriteIngredientsLineCell else {
            return UITableViewCell()
        }
        
        let recipe = recipes[indexRow]
        let recipeIngredients = recipe.ingredientsLine![indexPath.row]
        let recipeTirets = " - "
        
        cell.configure(tiret: recipeTirets, ingredient: recipeIngredients)
        
        return cell
    }
    

    
    
}
