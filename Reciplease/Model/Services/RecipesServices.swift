//
//  RecipesServices.swift
//  Reciplease
//
//  Created by Farid Benjomaa on 18/07/2021.
//

import Foundation
import Alamofire

class RecipesServices {
    
    
    var recipesData: RecipesData!
    let baseString = "https://api.edamam.com/api/recipes/v2?type=public"
    let appID = "&app_id=e10fb34e"
    let appKey = "&app_key=baf5b3745dd30737d20f37b7ffda545f"
    var image : [String] = []
    
    let list : [String]
    
    init(list: Array<String>) {
        self.list = list
    }
    
    func getURL() -> String {
        var ingredients = ""
        for ingredient in list {
            ingredients += "\(ingredient) ".addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
        }
        let ingredientsURL = "&q=\(ingredients)"
        let URLString = baseString + appID + appKey + ingredientsURL
        return URLString
    }
    
    private var task: URLSessionTask?
    private var recipesSession = URLSession(configuration: .default)
    private var imageSession = URLSession(configuration: .default)
    
    func getRecipe (callback: @escaping (Bool, RecipesData?) -> Void){
        
        let URLString = getURL()
        
        if let url = URL(string: URLString) {
            task =  recipesSession.dataTask(with: url) { (data, response, error) in
                DispatchQueue.main.async {
                    if let data = data {
                        do {
                            let result = try JSONDecoder().decode(RecipesAPI.self, from: data)
                            
                            var label: [String] = []
                            var totalTime: [Int] = []
                            var imageData : [Data] = []
                            var ingredientLines : [[String]] = [[]]
                            var dishType : [[String]] = [[]]
                            
                            for (_ ,item) in result.hits.enumerated() {
                                self.image.append(item.recipe.image)
                                label.append(item.recipe.label)
                                totalTime.append(item.recipe.totalTime)
                                ingredientLines.append(item.recipe.ingredientLines)
                                dishType.append(item.recipe.dishType ?? [])
                            }
                            
                            
                            self.getIcon { (data) in
                                if let data = data {
                                    imageData.append(data)
                                    self.recipesData = RecipesData(image: self.image, label: label, totalTime: totalTime, dishType : dishType, imageData: imageData, ingredientsline: ingredientLines)
                                 
                                    callback(true, self.recipesData)
                                }else {
                                    callback(false, nil)
                                }
                            }
                        } catch {
                            print(error.localizedDescription)
                            callback(false, nil)
                        }
                        if let error = error {
                            print("Error: \(error.localizedDescription)" )
                            callback(false, nil)
                        }
                    }
                }
            }
            task?.resume()
        }else {
            print("Cette url n'existe pas")
        }
    }
    
    var i = 0
    
    func getIcon(completionHandler: @escaping (Data?) -> Void){
        while self.image.count > i {
            if let url = URL(string: self.image[i]) {
                task = imageSession.dataTask(with: url) { (data, response, error) in
                    DispatchQueue.main.async {
                        if let data = data, error == nil {
                            do {
                                if let response = response as? HTTPURLResponse, response.statusCode == 200 {
                                    completionHandler(data)
                                }
                                if let error = error {
                                    print(error.localizedDescription)
                                    completionHandler(nil)
                                }
                            }
                        }
                    }
                }
            }
            task?.resume()
            i += 1
        }
    }
    
}







