//
//  RecipesData.swift
//  Reciplease
//
//  Created by Farid Benjomaa on 18/07/2021.
//


import Foundation

// MARK: - Recipes
struct RecipesData: Codable {
    let recipe: Recipe
    let links: Links

    enum CodingKeys: String, CodingKey {
        case recipe
        case links = "_links"
    }
}

// MARK: - Links
struct Links: Codable {
    let linksSelf, next: Next

    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
        case next
    }
}

// MARK: - Next
struct Next: Codable {
    let href, title: String
}

// MARK: - Recipe
struct Recipe: Codable {
    let uri, label, image, source: String
    let url, shareAs: String
    let yield: Int
    let dietLabels, healthLabels, cautions, ingredientLines: [String]
    let ingredients: [Ingredient]
    let calories, totalWeight: Int
    let cuisineType, mealType, dishType: [String]
    let totalNutrients, totalDaily: TotalDaily
    let digest: [Digest]
}

// MARK: - Digest
struct Digest: Codable {
    let label, tag, schemaOrgTag: String
    let total: Int
    let hasRDI: Bool
    let daily: Int
    let unit: String
    let sub: TotalDaily
}

// MARK: - TotalDaily
struct TotalDaily: Codable {
}

// MARK: - Ingredient
struct Ingredient: Codable {
    let text: String
    let quantity: Int
    let measure, food: String
    let weight: Int
    let foodID: String

    enum CodingKeys: String, CodingKey {
        case text, quantity, measure, food, weight
        case foodID = "foodId"
    }
}
