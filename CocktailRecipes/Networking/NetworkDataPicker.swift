//
//  NetworkDataPicker.swift
//  Teamplate
//
//  Created by Руслан Мингалиев on 14.12.2022.
//

import Foundation

class ApiManager {
    
    static let shared = ApiManager()
    
    func cocktailRequest() {
        guard let url = URL(string:Links.cocktailUrl.rawValue) else {return }
        URLSession.shared.dataTask(with: url){ data, _, error in
            guard let data else {
                print(error?.localizedDescription ?? "No ERROR")
                return
            }
            do {
                let coctail = try JSONDecoder().decode(Drinks.self, from: data)
                print(coctail)
            } catch let error {
                print(error)
            }
        }.resume()
    }
}
