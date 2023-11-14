//
//  CoctailRecipesCollectionViewController.swift
//  CocktailRecipes
//
//  Created by Руслан Мингалиев on 16.10.2023.
//

import UIKit

private let reuseIdentifier = "Cell"

class CoctailRecipesCollectionViewController: UICollectionViewController {

	//var coctailsRecip: [CoctailsRecip] = []
	var coctailRecip: [CoctailRecip] = []
	
	override func viewDidLoad() {
        super.viewDidLoad()
		fetchCoctails()
	}

	private func fetchCoctails() {
		NetworkCoctailRecipesManager.shared.fetchCoctailRecipesInfo(from: NetworkCoctailRecipesManager.shared.urlAPI) { result in
			switch result {
			case .success(let coctail):
				DispatchQueue.main.async {
					self.coctailRecip = coctail.drinks
					self.collectionView.reloadData()
				}
			case .failure(let error):
				print(error)
			}
		}
	}


    // MARK: UICollectionViewDataSource

	override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		
		return coctailRecip.count
		
	}

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CoctailRecipesCollectionViewCell
		
		let coctailRecipes = coctailRecip[indexPath.item]
		
		cell.configure(with: coctailRecipes)
		
		return cell

    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
