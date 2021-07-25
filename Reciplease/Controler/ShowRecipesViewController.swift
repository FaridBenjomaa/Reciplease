//
//  ShowRecipesViewController.swift
//  Reciplease
//
//  Created by Farid Benjomaa on 25/07/2021.
//

import UIKit

class ShowRecipesViewController: UIViewController {

    var recipesData: RecipesData!
    var recipeLabel : String!
    var imageData : Data!
    var totalTime : Int!
    var valueToPass : String!
    var ingredientsline : [String]!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleRecipes.text = recipeLabel
        recipesImage.image = UIImage(data: imageData)
    }
    
 
    @IBOutlet weak var recipesImage: UIImageView!
    @IBOutlet weak var titleRecipes: UILabel!

}

extension ShowRecipesViewController : UITableViewDataSource, UITableViewDelegate {
    
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
        
        let ingredient = ingredientsline[indexPath.row]
        print(ingredient)
        cell.configure(tiret: " - ", ingredient: ingredient)
        
        return cell
    }
    
    
    

}
