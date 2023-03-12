//
//  pricedataModel.swift
//  Shopify Admin
//
//  Created by Ahmed Fekry on 13/03/2023.
//

import Foundation
struct priceModel : Codable {
    var price_rule : PriceRule
}
struct PriceRule : Codable {
    var id : Int?
    var title : String?
}
struct AllpriceModel : Decodable {
    var price_rules : [PriceRule]?
}




