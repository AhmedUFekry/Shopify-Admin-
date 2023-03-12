//
//  CopounsViewModel.swift
//  Shopify Admin
//
//  Created by Ahmed Fekry on 13/03/2023.
//

import Foundation
class CopounsViewModel {
    
    var bindingCopouns : (()->()) = {}
    var AllCouponsResponse : AllpriceModel?{
        didSet{
                bindingCopouns()
        }
    }
    
    
    let CopounsURL = "https://12cda6f78842e3d15dd501d7e1fbc322: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@mad-ios1.myshopify.com/admin/api/2023-01/price_rules.json"
    
    
    
    func getAllCopouns (){
        ApiService.fetchFromApi(API_URL: CopounsURL) { [weak self] data in
            self?.AllCouponsResponse = data
            
        }
    }
    
    func deleteCoupon(priceRuleID: Int){
        
        DeleteCouponNetworkManager.deletePriceRule(priceRuleID: priceRuleID) {
            print("copoun deleted")
        }
        
    }
    

    
    
}
