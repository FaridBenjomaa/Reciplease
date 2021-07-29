//
//  IngredientsListTestCase.swift
//  RecipleaseTests
//
//  Created by Farid Benjomaa on 29/07/2021.
//
@testable import Reciplease
import XCTest

class IngredientsListTestCase: XCTestCase {
    var ingredients = IngredientsList()

    func testRemoveIngredientsInListShouldRemoveElement() {
        ingredients.names = ["egg", "chicken", "tomatoes"]
            
        ingredients.removeElement(at: 2)
        
        XCTAssertEqual(ingredients.names.count, 2)
        XCTAssertEqual(ingredients.names, ["egg", "chicken"])
           
        }

    func testAddIngredientsInListShouldaddElement() {
        ingredients.names = ["egg", "chicken", "tomatoes"]
            
        ingredients.names.append("fromages")
        
       
        XCTAssertEqual(ingredients.names[3], "fromages")
           
        }

    
}
