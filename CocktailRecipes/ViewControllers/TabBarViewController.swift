//
//  TabBarViewController.swift
//  CocktailRecipes
//
//  Created by Руслан Мингалиев on 17.10.2023.
//

import UIKit

class TabBarViewController: UITabBarController {

	var coctailRecip: [CoctailRecip] = []
	
	override func viewDidLoad() {
        super.viewDidLoad()
		setupViewController()
        // Do any additional setup after loading the view.
    }
    
	private func setupViewController() {
		guard let coctailRecipesVC = viewControllers?.first as? CoctailRecipesCollectionViewController else { return }
		//guard let sectionVC = viewControllers?.last as? OtherContactListViewController else { return }
		
		
		func fetchCoctails() {
			NetworkCoctailRecipesManager.shared.fetchCoctailRecipesInfo(from: NetworkCoctailRecipesManager.shared.urlAPI) { result in
				switch result {
				case .success(let coctail):
					DispatchQueue.main.async {
						//self.coctailRecip = coctail
						//coctailRecipesVC.coctailRecip = coctail
					}
				case .failure(let error):
					print(error)
				}
			}
		}
		
		
		
		
	}
	

	
	
	
	
	

	
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
