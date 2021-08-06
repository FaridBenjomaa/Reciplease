//
//  Recipes.swift
//  Reciplease
//
//  Created by Farid Benjomaa on 27/07/2021.
//

import Foundation
import CoreData

class Recipes : NSManagedObject {
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
    
    var ingredientsList : [String] = [ ]
    
}



   


