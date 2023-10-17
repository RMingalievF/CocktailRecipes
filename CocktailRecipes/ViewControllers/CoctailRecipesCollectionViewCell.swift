//
//  CoctailRecipesCollectionViewCell.swift
//  CocktailRecipes
//
//  Created by Руслан Мингалиев on 16.10.2023.
//

import UIKit

class CoctailRecipesCollectionViewCell: UICollectionViewCell {
	
	@IBOutlet private var imageView: UIImageView! {
		didSet {
			imageView.layer.cornerRadius = 10
		}
	}
	
	@IBOutlet private var coctailNameLabel: UILabel!
	
	func configure(with coctail: CoctailRecip) {
		coctailNameLabel.text = coctail.strDrink
		
		NetworkCoctailRecipesManager.shared.fetchImage(from: coctail.strDrinkThumb!) { result in
			switch result {
				
			case .success(let imageData):
				self.imageView.image = UIImage(data: imageData)
			case .failure(let error):
				print(error)
			}
		}
	}
}
