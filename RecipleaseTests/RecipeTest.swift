//
//  RecipeTest.swift
//  RecipleaseTests
//
//  Created by Farid Benjomaa on 27/08/2021.
//

import XCTest
@testable import Reciplease

class RecipeTest: XCTestCase {
   
    let recipe = Recipes()
    
    func testGetRecipeItemsShouldSave(){
        
        //Given
       
        let image = Data(base64Encoded: "test")
        let label = "testLabel"
        let time = 20
        let url = "url"
        let ingredients = ["egg","chocoleate","milk"]
        let imageview = UIImageView(image: UIImage(data: Data(base64Encoded: "test")!))
        
        
        //When
        recipe.saveRecipes(image: image!, label: label, time: time, url: url, ingredients: ingredients, recipesImage: imageview)
        
        
        //Then
        XCTAssertNotNil(recipe)
        
    }
    

}
