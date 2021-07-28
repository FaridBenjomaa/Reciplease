//
//  FavoriteViewController.swift
//  Reciplease
//
//  Created by Farid Benjomaa on 18/07/2021.
//

import UIKit
import CoreData

class FavoriteViewController: UIViewController, NSFetchedResultsControllerDelegate{
    
    var result : NSFetchedResultsController<Recipes>!
    
    var recipesList : [Recipes] = []
    
 
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(recipesList)
        
        let request: NSFetchRequest<Recipes>! = Recipes.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: "label", ascending: true)
        request.sortDescriptors = [sortDescriptor]
        
        let context = AppDelegate.persistantContainer.viewContext
        result = NSFetchedResultsController(fetchRequest: request, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        result.delegate = self
        
        do {
            try result.performFetch()
            if let fetchObject = result.fetchedObjects {
                recipesList = fetchObject
            }
        }catch{
            print(error)
        }
        
    }
    
  
}

extension FavoriteViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier:  "FavoriteRecipeCell" ,for: indexPath ) as?
                PresentFavoriteRecipesListTableViewCell else {
            return UITableViewCell()
        }
        
        let recipeLabel = recipesList[indexPath.row].label
        let imageData = recipesList[indexPath.row].imageData
        let totalTime = recipesList[indexPath.row].totalTime
        
        cell.configure(labelNameText: recipeLabel!, imageDatas: imageData!, totalTime: Int(totalTime), timerlabel: cell.timerlabel)
        
        
        return cell
    }
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch type {
        case .insert:
            if let newIndexPath = newIndexPath{
                tableView.insertRows(at: [newIndexPath], with: .fade)
            }
        case .delete :
            if let indexPath = indexPath{
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
        case .update:
            if let indexPath = indexPath{
                tableView.reloadRows(at: [indexPath], with: .fade)
            }
        default:
            tableView.reloadData()
        }
        
        if let fetchedObjects = controller.fetchedObjects {
            recipesList = fetchedObjects as! [Recipes]
        }
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
    }
}


