//
//  IngredientName.swift
//  Reciplease
//
//  Created by Farid Benjomaa on 27/08/2021.
//

import Foundation
import CoreData

class IngredientListName: NSManagedObject {
    static var all: [IngredientListName] {
        let request: NSFetchRequest<IngredientListName> = IngredientListName.fetchRequest()
        request.sortDescriptors = [
            NSSortDescriptor(key: "name", ascending: true)
        ]
        guard let ingredients = try? AppDelegate.viewContex.fetch(request) else {
            return []
        }
        return ingredients
    }
    

    func save(item : String, recipe: Recipes){
        let ingredient = IngredientListName(context: AppDelegate.viewContex)
        ingredient.name = item
        ingredient.recipe = recipe
        try? AppDelegate.viewContex.save()
    }
 
}

