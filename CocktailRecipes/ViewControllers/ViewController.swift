//
//  ViewController.swift
//  Teamplate
//
//  Created by Руслан Мингалиев on 14.12.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NetworkManager.shared.cocktailRequest()
    }


}

