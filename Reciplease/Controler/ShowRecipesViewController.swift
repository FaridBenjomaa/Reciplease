//
//  ShowRecipesViewController.swift
//  Reciplease
//
//  Created by Farid Benjomaa on 25/07/2021.
//

import UIKit
import CoreData

class ShowRecipesViewController: UIViewController {

    var recipesData: RecipesData!
    var presentRecipes = PresentRecipesListTableViewCell()
    var recipeLabel : String!
    var imageData : Data!
    var totalTime : Int!
    var valueToPass : String!
    var ingredientsline : [String]!
    var ingredient : String!
 
    
    var recipe = Recipes()
    var recipesList : [Recipes] = []
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var recipesImage: UIImageView!
    @IBOutlet weak var titleRecipes: UILabel!
    
    @IBAction func addFavorite(_ sender: Any) {

        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "star.fill"),
            style: .done,
            target: self,
            action: nil)

        let image = imageData
        let label = recipeLabel
        let time = totalTime
        let ingredients = ingredientsline

        saveRecipes(image: image!, label: label!, time: time!, ingredients: ingredients!)
 
    }
    //TODO modifier l'action du bouton si il est plein
 
    func saveRecipes(image: Data, label: String, time: Int, ingredients : [String]) {
        recipe = Recipes(context: AppDelegate.viewContex)
        recipe.imageData = image
        recipe.label =  label
        recipe.totalTime = Int16(time)
        recipe.ingredientsLine = ingredients
        try? AppDelegate.viewContex.save()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleRecipes.text = recipeLabel
        recipesImage.image = UIImage(data: imageData)
        presentRecipes.convertionTime(totalTime, timerLabel)
    }

}


extension ShowRecipesViewController : UITableViewDataSource, UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ingredientsline.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier:  "ingredientsLineCell" ,for: indexPath ) as?
                IngredientsLineTableViewCell else {
                     return UITableViewCell()
                }
        
        ingredient = ingredientsline[indexPath.row]
        cell.configure(tiret: " - ", ingredient: ingredient)
        
        return cell
    }
    
}


