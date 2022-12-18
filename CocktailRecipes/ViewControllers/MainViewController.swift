//
//  ViewController.swift
//  Teamplate
//
//  Created by Руслан Мингалиев on 14.12.2022.
//

import UIKit

class MainViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var coctailCollectionView: UICollectionView!
    
    
    private var coctails: [Coctail] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchListCoctails()
        
    }

        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            coctails.count
           }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CoctailSell
            
            let coctailName = coctails[indexPath.item]
            cell.configure(with: coctailName)
            
            return cell
        }
    }


extension MainViewController {
    func fetchListCoctails() {
        NetworkManager.shared.fetch(Coctails.self, from: Links.listAllCoctailsUrl.rawValue) { [weak self] result in
            switch result {
            case .success(let drinks):
                self?.coctails = drinks.drinks
                //self?.coctailName =
                self?.coctailCollectionView.reloadData()
                print(drinks.drinks.count)
                print(drinks)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}

