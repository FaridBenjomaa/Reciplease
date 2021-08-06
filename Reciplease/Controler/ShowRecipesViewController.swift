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
    var ingredientsline : [String] = []
    var ingredients : [String] = []
    var ingredient : String!
    var url : String!
    var urlWebPage: String!

    var recipe = Recipes()
    var recipes = Recipes.all
    var recipesList : [Recipes] = []

    //MARK: Outlets 
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var recipesImage: UIImageView!
    @IBOutlet weak var titleRecipes: UILabel!
    @IBOutlet weak var tableView: UITableView!

    
    
    @IBAction func showWebPage(_ sender: Any) {
       urlWebPage = url
        performSegue(withIdentifier: "APIToWebPage", sender: self)
    }

    fileprivate func addToFavorite(_ image: Data?, _ label: String?, _ time: Int?, _ url: String?) {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "star.fill"),
            style: .done,
            target: self,
            action: nil)
        
        saveRecipes(image: image!, label: label!, time: time!, url: url!)
    }
    
  
    
    @IBAction func addFavorite(_ sender: Any) {

        let image = imageData
        let label = recipeLabel
        let time = totalTime
        let url = url
        
        addToFavorite (image, label, time, url)
    }


    func saveRecipes(image: Data, label: String, time: Int, url: String) {
        recipe = Recipes(context: AppDelegate.viewContex)
        if let image = recipesImage.image {
            recipe.imageData = image.pngData()
        }
        recipe.label =  label
        recipe.totalTime = Int16(time)
        recipe.url = url
    
        for item in ingredients {
            recipe.ingredientLine = item
            recipe.ingredientsList.append(recipe.ingredientLine!)
        }

        try? AppDelegate.viewContex.save()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleRecipes.text = recipeLabel
        recipesImage.image = UIImage(data: imageData)
        presentRecipes.convertionTime(totalTime, timerLabel)

    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "APIToWebPage" {
            let vc = segue.destination as! WebViewController
            vc.urlWebPage = urlWebPage
        }
    }
}



extension ShowRecipesViewController : UITableViewDataSource, UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       var ingredientIndex = 0
        if ingredients.count > 0 {
            ingredientIndex = ingredients.count
        }else if ingredientsline.count > 0{
            ingredientIndex = ingredientsline.count
        }
        return ingredientIndex
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier:  "ingredientsLineCell" ,for: indexPath ) as?
                IngredientsLineTableViewCell else {
                     return UITableViewCell()
                }
        
        if ingredients.count > 0 {
            ingredient = ingredients[indexPath.row]
        }else if ingredientsline.count > 0{
            ingredient =  ingredientsline[indexPath.row]
        }
      
        
        cell.configure(tiret: " - ", ingredient: ingredient!)
        
        return cell
    }

}


