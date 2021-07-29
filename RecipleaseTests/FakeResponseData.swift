//
//  FakeResponseData.swift
//  RecipleaseTests
//
//  Created by Farid Benjomaa on 29/07/2021.
//

import Foundation

class FakeResponseData {
    let responseOK = HTTPURLResponse(url: URL(string: "https://api.edamam.com/api/recipes/v2?type=public&app_id=e10fb34e&app_key=baf5b3745dd30737d20f37b7ffda545f")!, statusCode: 200, httpVersion: nil, headerFields: nil)!
    let responseKO = HTTPURLResponse(url: URL(string: "https://api.edamam.com/api/recipes/v2?type=public&app_id=e10fb34e&app_key=baf5b3745dd30737d20f37b7ffda545f")!, statusCode: 500, httpVersion: nil, headerFields: nil)!
    
    class RecipesError: Error {
        
    }
    let recipesError = RecipesError()

    
    var recipesCorrectData : Data {
        let bundle = Bundle(for: FakeResponseData.self)
        let url = bundle.url(forResource: "recipes", withExtension: "json")
        let data = try! Data(contentsOf: url!)
        return data
    }

    let recipesIncorrectData = "erreur".data(using: .utf8)!
    let imageData = "image".data(using: .utf8)!
    
}
