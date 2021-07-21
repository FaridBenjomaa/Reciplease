//
//  RecipesData.swift
//  Reciplease
//
//  Created by Farid Benjomaa on 18/07/2021.
//


import Foundation


// MARK: - RecipesAPI
struct RecipesAPI: Codable {
    let from, to, count: Int
    let links: RecipesAPILinks
    let hits: [Hit]

    enum CodingKeys: String, CodingKey {
        case from, to, count
        case links = "_links"
        case hits
    }
}

// MARK: - Hit
struct Hit: Codable {
    let recipe: Recipe
    let links: HitLinks

    enum CodingKeys: String, CodingKey {
        case recipe
        case links = "_links"
    }
}

// MARK: - HitLinks
struct HitLinks: Codable {
    let linksSelf: SelfClass

    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
    }
}

// MARK: - SelfClass
struct SelfClass: Codable {
    let href: String
    let title: String
}

// MARK: - Recipe
struct Recipe: Codable {
    let uri: String
    let label: String
    let image: String
    let source: String
    let url: String
    let shareAs: String
    let yield: Int
    let dietLabels, healthLabels, cautions, ingredientLines: [String]
    let ingredients: [Ingredient]
    let calories, totalWeight: Double
    let totalTime: Int
    let cuisineType, mealType, dishType: [String]?
    let totalNutrients, totalDaily: [String: Total]
    let digest: [Digest]
}

// MARK: - Digest
struct Digest: Codable {
    let label, tag: String
    let schemaOrgTag: String?
    let total: Double
    let hasRDI: Bool
    let daily: Double
    let unit: Unit
    let sub: [Digest]?
}

enum Unit: String, Codable {
    case empty = "%"
    case g = "g"
    case kcal = "kcal"
    case mg = "mg"
    case µg = "µg"
}

// MARK: - Ingredient
struct Ingredient: Codable {
    let text: String
    let weight: Double
    let foodCategory: String?
    let foodID: String
    let image: String?

    enum CodingKeys: String, CodingKey {
        case text, weight, foodCategory
        case foodID = "foodId"
        case image
    }
}

// MARK: - Total
struct Total: Codable {
    let label: String
    let quantity: Double
    let unit: Unit
}

// MARK: - RecipesAPILinks
struct RecipesAPILinks: Codable {
}





