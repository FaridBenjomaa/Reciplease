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

    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var ingdredientsToAdd: UITextField!
    @IBAction func seachButton(_ sender: Any) {
        if list.names.count > 0 {
            createList(listing: list.names)
            performSegue(withIdentifier: "segueToGetRecipes", sender: self)
        }else {
            presentAlertEmptyList()
        }
        
    }
    
    func presentAlertEmptyList(){
        let alertVC = UIAlertController(title: "Error", message: "Merci d'ajouter un ingredient a la liste" , preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(alertVC, animated: true, completion: nil)
    }

    fileprivate func createList(listing : [String]) {
        tableView.reloadData()
        recipesServices = RecipesServices(list: listing)
        getRecipes(recipesServices: recipesServices!)
     
    }
    
    fileprivate func addIngredients() {
        let newIngredient = ingdredientsToAdd.text
        list.names.append(newIngredient!)
        createList(listing : list.names)
    }
    
    @IBAction func add(_ sender: Any) {
        addIngredients()
    }
    
    @IBAction func clearButton(_ sender: Any) {
        list.names.removeAll()
        createList(listing: list.names)
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

extension SearchViewController : UITableViewDataSource {
   
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

extension SearchViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            list.removeElement(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .left)
            createList(listing: list.names)
        }
    }
    
}

extension SearchViewController : UITextFieldDelegate {

    @IBAction func dismissKeyboard(_ sender: Any) {
        ingdredientsToAdd.resignFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        addIngredients()
        ingdredientsToAdd.resignFirstResponder()
        return true
    }
}
