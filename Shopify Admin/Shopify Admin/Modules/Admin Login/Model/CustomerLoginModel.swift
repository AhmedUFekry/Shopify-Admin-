//
//  CustomerLoginModel.swift
//  Shopify Admin
//
//  Created by Ahmed Fekry on 07/03/2023.
//

import Foundation
class AllCustomers : Decodable{
    
    let customers : [CustomerLogin]
}

class CustomerLogin: Decodable {
    let id: Int?
    let email: String?
    let note:String?
}

