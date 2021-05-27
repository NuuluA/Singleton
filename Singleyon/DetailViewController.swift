//
//  DetailViewController.swift
//  Singleyon
//
//  Created by Арген on 27.05.2021.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var passTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTF.text = AccountService.shared.name
        passTF.text = String(AccountService.shared.password)
      
    }

}
