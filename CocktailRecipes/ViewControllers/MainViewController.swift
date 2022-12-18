//
//  ViewController.swift
//  Teamplate
//
//  Created by Руслан Мингалиев on 14.12.2022.
//

import UIKit

class MainViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NetworkManager.shared.cocktailRequest()
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        return cell
    }

}


