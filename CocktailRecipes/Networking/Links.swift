//
//  ApiManager.swift
//  Teamplate
//
//  Created by Руслан Мингалиев on 14.12.2022.
//

enum Links: String {
    case cocktailUrl = "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=margarita"
    case listAllCoctailsUrl = "https://www.thecocktaildb.com/api/json/v1/1/search.php?f=a"
    }

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}
