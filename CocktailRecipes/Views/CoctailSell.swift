//
//  CoctailSell.swift
//  CocktailRecipes
//
//  Created by Руслан Мингалиев on 18.12.2022.
//

import UIKit

class CoctailSell: UICollectionViewCell {
    
    @IBOutlet weak var coctailImage: UIImageView!
    @IBOutlet weak var coctailNameLabel: UILabel!
    
    func configure(with coctail: Coctail) {
        coctailNameLabel.text = coctail.strDrink

        
        
        NetworkManager.shared.fetchImage(from: coctail.strDrinkThumb) { [weak self] result in
            switch result {
            case .success(let imageData):
                self?.coctailImage.image = UIImage(data: imageData)
            case .failure(let error):
                print(error)
            }
        }
        
    }
}
