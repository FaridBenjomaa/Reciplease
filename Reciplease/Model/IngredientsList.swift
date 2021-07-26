//
//  Ingredients.swift
//  Reciplease
//
//  Created by Farid Benjomaa on 20/07/2021.
//

import Foundation

struct IngredientsList{
    var names : [String] = []
    
    mutating func removeElement(at index: Int){
        names.remove(at: index)
    }
   
}
