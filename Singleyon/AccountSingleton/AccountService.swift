//
//  AccountService.swift
//  Singleyon
//
//  Created by Арген on 27.05.2021.
//

import Foundation

final class AccountService {
    private init() {}
    
    static let shared = AccountService()
    
    var name: String = ""
    var password: Int = 0
}
