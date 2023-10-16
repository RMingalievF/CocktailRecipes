//
//  NetworkCoctailRecipesManager.swift
//  CocktailRecipes
//
//  Created by Руслан Мингалиев on 16.10.2023.
//

import Foundation

enum NetworkError: Error {
	case invalidURL
	case noData
	case decodingError
	case invalidStatusCode
}

class NetworkCoctailRecipesManager {
	
	static let shared = NetworkCoctailRecipesManager()
	
	let urlAPI = "https://www.thecocktaildb.com/api/json/v1/1/search.php?f=a"
	
	private init() {}
	
	func fetchCoctailRecipesInfo(from url: String, completion: @escaping (Result<[Coctail], NetworkError>) -> Void) {
		guard let url = URL(string: urlAPI) else {
			completion(.failure(.invalidURL))
			return
		}
		
		URLSession.shared.dataTask(with: url) { data, response, error in
			guard let data = data else {
				print(error?.localizedDescription ?? "No error description")
				completion(.failure(.noData))
				return
			}
			guard let httpResponse = response as? HTTPURLResponse,
				  (200..<300).contains(httpResponse.statusCode) else {
				completion(.failure(.invalidStatusCode))
				return
			}
			do {
				let coctailRecipes = try JSONDecoder().decode([Coctail].self, from: data)
				DispatchQueue.main.async {
					completion(.success(coctailRecipes))
					print(data)
				}
			} catch {
				completion(.failure(.decodingError))
			}
		}
		.resume()
	}
	
	func fetchImage(from url: String, completion: @escaping(Result<Data, NetworkError>) -> Void) {
		guard let url = URL(string: url) else {
			completion(.failure(.invalidURL))
			return
		}
		DispatchQueue.global().async {
			guard let imageData = try? Data(contentsOf: url) else {
				completion(.failure(.noData))
				return
			}
			DispatchQueue.main.async {
				completion(.success(imageData))
			}
		}
	}
}
