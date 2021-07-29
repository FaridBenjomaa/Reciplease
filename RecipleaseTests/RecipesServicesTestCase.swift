//
//  RecipesServicesTestCase.swift
//  RecipleaseTests
//
//  Created by Farid Benjomaa on 29/07/2021.
//
@testable import Reciplease
import XCTest

class RecipesServicesTestCase: XCTestCase {

    func testGetRecipesShouldPostFailledCallbackifError(){
        let ingredientsList = ["egg", "Chicken","Tomatoes"]
        
        let recipseService = RecipesServices(
            recipesSession: URLRecipesFake(data: nil, response: nil, error: FakeResponseData.init().recipesError),
            imageSession: URLRecipesFake(data: nil, response: nil, error: nil),
            list: ingredientsList)
        
        recipseService.getRecipe { (success, recipe) in
            XCTAssertFalse(success)
            XCTAssertNil(recipe)
        }
        
    }
    func testGetRecipesShouldPostFailledCallbackifNoData(){
        let ingredientsList = ["egg", "Chicken","Tomatoes"]
        
        let recipseService = RecipesServices(
            recipesSession: URLRecipesFake(data: nil, response: nil, error: nil),
            imageSession: URLRecipesFake(data: nil, response: nil, error: nil),
            list: ingredientsList)
        
        recipseService.getRecipe { (success, recipe) in
            XCTAssertFalse(success)
            XCTAssertNil(recipe)
        }
        
    }
    
    func testGetRecipesShouldPostFailledCallbackifIncorectResponse(){
        let ingredientsList = ["egg", "Chicken","Tomatoes"]
        
        let recipseService = RecipesServices(
            recipesSession: URLRecipesFake(data: FakeResponseData.init().recipesCorrectData, response: FakeResponseData.init().responseKO, error: nil),
            imageSession: URLRecipesFake(data: nil, response: nil, error: nil),
            list: ingredientsList)
        
        recipseService.getRecipe { (success, recipe) in
            XCTAssertFalse(success)
            XCTAssertNil(recipe)
        }
        
    }
    
    func testGetRecipesShouldPostFailledCallbackifIncorectData(){
        let ingredientsList = ["egg", "Chicken","Tomatoes"]
        
        let recipseService = RecipesServices(
            recipesSession: URLRecipesFake(data: FakeResponseData.init().recipesIncorrectData, response: FakeResponseData.init().responseOK, error: nil),
            imageSession: URLRecipesFake(data: nil, response: nil, error: nil),
            list: ingredientsList)
        
        recipseService.getRecipe { (success, recipe) in
            XCTAssertFalse(success)
            XCTAssertNil(recipe)
        }
    }
    
    func testGetRecipesShouldPostSuccesCallbackifNoErrorAndCorrectData(){
        let ingredientsList = ["egg", "Chicken","Tomatoes"]
        
        let recipseService = RecipesServices(
            recipesSession: URLRecipesFake(data: FakeResponseData.init().recipesCorrectData, response: FakeResponseData.init().responseOK, error: nil),
            imageSession: URLRecipesFake(data: FakeResponseData.init().imageData, response: FakeResponseData.init().responseOK, error: nil),
            list: ingredientsList)
        
        let label = "Jordan Marsh-Inspired Blueberry Muffins"
        let  ingredientLines = [
        "1/2 cup (8 tablespoons) butter",
        "1 cup sugar",
        "2 large eggs",
        "2 teaspoons baking powder",
        "1/2 teaspoon salt",
        "1 teaspoon vanilla extract",
        "2 cups King Arthur Unbleached All-Purpose Flour",
        "1/2 cup milk",
        "2 1/2 cups blueberries, fresh preferred",
        "1/4 cup sugar, for topping"
    ]

        recipseService.getRecipe { (success, recipe) in
            XCTAssertTrue(success)
            XCTAssertNotNil(recipe)
            XCTAssertEqual(label, recipe!.label[0])
            XCTAssertEqual(ingredientLines, recipe!.ingredientsline[0])
            
        }
    }
}
 
 
