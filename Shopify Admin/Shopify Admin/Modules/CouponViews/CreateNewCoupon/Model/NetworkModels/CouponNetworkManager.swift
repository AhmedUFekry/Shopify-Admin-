//
//  CouponNetworkManager.swift
//  Shopify Admin
//
//  Created by Ahmed Fekry on 13/03/2023.
//

import Foundation
class CouponNetworkManager {
    
   static func addNewCopoun(priceRuleID : Int , codeName: String){
        
        guard let url = URL(string: "https://12cda6f78842e3d15dd501d7e1fbc322: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@mad-ios1.myshopify.com/admin/api/2023-01/price_rules/\(priceRuleID)/discount_codes.json") else {
            print("error in URL")
            return
        }
        var requeest = URLRequest(url: url)
        requeest.httpMethod = "POST"
        requeest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let body : [String : Any] = ["discount_code": ["price_rule_id": priceRuleID,
                                                    "code" : "\(codeName)",
                                                    
                                                 ]
                                     ]
        
        requeest.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
        requeest.httpShouldHandleCookies = false
        
        let task = URLSession.shared.dataTask(with: requeest, completionHandler: {data , response ,error in
            guard let data = data , error == nil else{return}
            if let httpResponse = response as? HTTPURLResponse {
                print("New Copoun Added: \(httpResponse.statusCode)")
            }
            do{
                let response = try  JSONSerialization.jsonObject(with: data, options: .allowFragments)
                print(response)
            }catch {
                print(error.localizedDescription)
            }
        })
        task.resume()
        
    }
    
    
    //************
    
    

    
    
    
    
    
    
}
