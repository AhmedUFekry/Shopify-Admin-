//
//  CustomerModel.swift
//  Shopify Admin
//
//  Created by Ahmed Fekry on 07/03/2023.
//

import Foundation
class Newcustomer:Codable{
    var customers:[Customer]
}

class Customer:Codable{
    var id:String?
    var first_name:String?
    var last_name:String?
    var email:String?
    var note:String?
}
