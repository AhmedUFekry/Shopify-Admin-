//
//  CreateNewCouponViewModel.swift
//  Shopify Admin
//
//  Created by Ahmed Fekry on 13/03/2023.
//

import Foundation
class CreateNewCouponViewModel {
    var bindID : (() -> ()) = {}
    var priceModelObj : priceModel! {
        didSet{
            bindID()
        }
    }
    
    func addPriceRule (discValuee: String, titlee: String){
        
        PriceRulesNetworkManager.addNewPriceRule(discValue: discValuee, title: titlee) { priceModel in
            self.priceModelObj = priceModel
        }
        
    }
    
    func addNewCoupon(priceRileID : Int , codeName: String){
        CouponNetworkManager.addNewCopoun(priceRuleID: priceRileID, codeName: codeName)
        
    }
    
    
    
}
