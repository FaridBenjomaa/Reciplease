//
//  ShowRecipesViewController.swift
//  Reciplease
//
//  Created by Farid Benjomaa on 25/07/2021.
//

import UIKit
import CoreData

class ShowRecipesViewController: UIViewController {

    //MARK: Properties
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
    var ingredientName = IngredientListName.all
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
        
        recipe.saveRecipes(image: image!, label: label!, time: time!, url: url!, ingredients: ingredients, recipesImage: recipesImage)
     
    }
    

    
    @IBAction func addFavorite(_ sender: Any) {

        let image = imageData
        let label = recipeLabel
        let time = totalTime
        let url = url
        
        addToFavorite (image, label, time, url)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        titleRecipes.text = recipeLabel
        recipesImage.image = UIImage(data: imageData)
        presentRecipes.convertionTime(totalTime, timerLabel)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        ingredientName = IngredientListName.all
        tableView.reloadData()
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
        }else if ingredientName.count > 0{
            ingredientIndex = ingredientName.count
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
        }else if ingredientName.count > 0{
            
            let ingredientName =  ingredientName[indexPath.row]
            ingredient = ingredientName.name
        }

        cell.configure(tiret: " - ", ingredient: ingredient!)
        
        return cell
    }

}


