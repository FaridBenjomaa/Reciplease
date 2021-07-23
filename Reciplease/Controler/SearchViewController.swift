//
//  SearchViewController.swift
//  Reciplease
//
//  Created by Farid Benjomaa on 18/07/2021.
//

import UIKit


class SearchViewController: UIViewController{

    var list = IngredientsList()
    var recipesServices : RecipesServices?
    var recipesData: RecipesData!
   
    
    
    @IBAction func seachButton(_ sender: Any) {
        createList()
        performSegue(withIdentifier: "segueToGetRecipes", sender: self)
    }
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var ingdredientsToAdd: UITextField!
    
    fileprivate func createList() {
        tableView.reloadData()
        
        recipesServices = RecipesServices(list: list.names)
        
        getRecipes(recipesServices: recipesServices!)
    }
    
    fileprivate func addIngredients() {
        let newIngredient = ingdredientsToAdd.text
        list.names.append(newIngredient!)
        createList()
    }
    
    @IBAction func add(_ sender: Any) {
        addIngredients()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func getRecipes(recipesServices : RecipesServices){
        recipesServices.getRecipe { (success, recipesData) in
            if success, let recipesData = recipesData {
                self.update(recipesData: recipesData)
               
            }else {
                self.presentAlert()
            }
        }
    }
    
    func update(recipesData : RecipesData){
       
        self.recipesData = recipesData
    }

    func presentAlert(){
        let alertVC = UIAlertController(title: "Error", message: "Merci d'entrer un ingredient", preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(alertVC, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToGetRecipes" {
            let successVC = segue.destination as! RecipesListViewController
            successVC.recipesData = recipesData
        }
    }

}


extension SearchViewController : UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier:  "ingedientsCell" ,for: indexPath ) as?
                PresentIngredientsListTableViewCell else {
                     return UITableViewCell()
                }
        let ingredient = list.names[indexPath.row]
        
        
        cell.configure(tirets: " --- ", ingredient: "\(ingredient)")
        
        return cell
    }
    
  
    
}
