//
//  ViewController.swift
//  Singleyon
//
//  Created by Арген on 27.05.2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        ApiManager.shared.getUsers { users in
            print(users.count)
        }
    }
    
}

