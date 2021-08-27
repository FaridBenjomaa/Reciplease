//
//  Recipes.swift
//  Reciplease
//
//  Created by Farid Benjomaa on 27/07/2021.
//
import UIKit
import Foundation
import CoreData

class Recipes : NSManagedObject {
    
    var ingredientName = IngredientListName()
    var ingredientNames = IngredientListName.all
    
    static var all: [Recipes] {
        let request: NSFetchRequest<Recipes> = Recipes.fetchRequest()
        request.sortDescriptors = [
            NSSortDescriptor(key: "label", ascending: true)
        ]
        guard let recipes = try? AppDelegate.viewContex.fetch(request) else {
            return []
        }
        return recipes 
    }
    

    
    func saveRecipes(image: Data, label: String, time: Int, url: String, ingredients: [String], recipesImage: UIImageView) {
        let recipe = Recipes(context: AppDelegate.viewContex)
      
        
        if let image = recipesImage.image {
            recipe.imageData = image.pngData()
        }
        recipe.label =  label
        recipe.totalTime = Int16(time)
        recipe.url = url

        for item in ingredients {
            ingredientName.save(item: item, recipe: recipe)
           
        }
       

        try? AppDelegate.viewContex.save()
    }

}







