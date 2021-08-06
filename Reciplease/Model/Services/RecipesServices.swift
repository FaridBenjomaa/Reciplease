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

    
    func getURL() -> String {
        var ingredients = ""
        for ingredient in list {
            ingredients += "\(ingredient) ".addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
        }
        let ingredientsURL = "&q=\(ingredients)"
        let URLString = baseString + appID + appKey + ingredientsURL
        return URLString
    }
    
    
    private let afmanager: Session!
    init(afmanager: Session = Session.default, list: Array<String>) {
           self.afmanager = afmanager
           self.list = list
       }

    
    func getRecipe(callback: @escaping (Bool, RecipesData?) -> Void){

         let URLString = getURL()
        
         if let url = URL(string: URLString) {
            AF.request(url).validate().responseDecodable(of: RecipesAPI.self){ (response) in
                guard let result = response.value else { return }
               
                var label: [String] = []
                var totalTime: [Int] = []
                var imageData : [Data] = []
                var ingredientLines : [[String]] = [[]]
                var dishType : [[String]] = [[]]
                var url : [String] = []
                
                for (_ ,item) in result.hits.enumerated() {
                    self.image.append(item.recipe.image)
                    label.append(item.recipe.label)
                    totalTime.append(item.recipe.totalTime)
                    ingredientLines.append(item.recipe.ingredientLines)
                    dishType.append(item.recipe.dishType ?? [])
                    url.append(item.recipe.url)
                }
                
                self.getIcon { (data) in
                    if let data = data {
                        imageData.append(data)
                        self.recipesData = RecipesData(image: self.image, label: label, totalTime: totalTime, dishType : dishType, imageData: imageData, ingredientsline: ingredientLines, url: url)
                     
                        callback(true, self.recipesData)
                    }else {
                        callback(false, nil)
                    }
                }
         }
     }
        
}

    var i = 0
    
    func getIcon(completionHandler: @escaping (Data?) -> Void){
        while self.image.count > i {
            if let url = URL(string: self.image[i]) {
                AF.request(url).validate().responseData { (response) in
                    DispatchQueue.main.async {
                        guard let result = response.value else { return }

                                    completionHandler(result)
     
                                }
                            }
                        }
                        i += 1
                    }
                    
                }

}







