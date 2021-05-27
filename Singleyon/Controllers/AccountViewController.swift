//
//  AccountViewController.swift
//  Singleyon
//
//  Created by Арген on 27.05.2021.
//

import UIKit

class AccountViewController: UIViewController {
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var passTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func buttonAction(_ sender: UIButton) {
        guard let name = nameTF.text,
              let pass = passTF.text,
              let password = Int(pass) else { return }
        
        AccountService.shared.name = name
        AccountService.shared.password = password
    }
  
}
