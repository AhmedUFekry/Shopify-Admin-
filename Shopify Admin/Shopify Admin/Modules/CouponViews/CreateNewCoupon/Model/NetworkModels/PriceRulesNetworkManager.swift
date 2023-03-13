//
//  PriceRulesNetworkManager.swift
//  Shopify Admin
//
//  Created by Ahmed Fekry on 13/03/2023.
//

import Foundation

class PriceRulesNetworkManager {
    
    
    static func addNewPriceRule(discValue : String , title: String , complistion : @escaping (priceModel) -> Void){
        
        guard let url = URL(string: "https://12cda6f78842e3d15dd501d7e1fbc322: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@mad-ios1.myshopify.com/admin/api/2023-01/price_rules.json") else {
            print("error in URL")
            return
        }
        var requeest = URLRequest(url: url)
        requeest.httpMethod = "POST"
        requeest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let body : [String : Any] = ["price_rule": ["value_type": "percentage",
                                                    "value" : "-\(discValue)",
                                                    "customer_selection" : "all",
                                                    "target_type": "line_item",
                                                    "target_selection": "all",
                                                    "allocation_method": "across",
                                                    "starts_at": "2023-03-10",
                                                    "title" : "\(title)",
                                                    "once_per_customer" : false,
                                                 ]
                                     ]
        
        requeest.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
        requeest.httpShouldHandleCookies = false
        
        let task = URLSession.shared.dataTask(with: requeest, completionHandler: {data , response ,error in
            guard let data = data , error == nil else{return}
            if let httpResponse = response as? HTTPURLResponse {
                print("New Price Rule Added: \(httpResponse.statusCode)")
            }
            do{
                let response = try  JSONSerialization.jsonObject(with: data, options: .allowFragments)
                let result = try? JSONDecoder().decode(priceModel.self, from: data)
                complistion(result!)
                print(response)
            }catch {
                print(error.localizedDescription)
            }
        })
        task.resume()
        
    }



  static func deletePriceRule(priceRuleID: Int,completion:@escaping () -> Void) {
        let url = URL(string:"https://12cda6f78842e3d15dd501d7e1fbc322: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@mad-ios1.myshopify.com/admin/api/2023-01/price_rules/\(priceRuleID).json")
        var urlRequest = URLRequest(url: url!)
        urlRequest.httpMethod = "DELETE"
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-type")
        //urlRequest.httpShouldHandleCookies = false
        let task = URLSession.shared.dataTask(with: urlRequest) { data , response, error in
            guard data != nil else {
                print ("Price Rule not Found")
                return
            }
            
            guard let httpResponsee = response as? HTTPURLResponse else{return}
            if httpResponsee.statusCode == 204{
                print("Price Rule removed successfully \(httpResponsee.statusCode)")
            }else{
                print(" ********** faild to delete Price Rule \(httpResponsee.statusCode)************")
                
            }
            
        }
        task.resume()
    }

    
    
    
    
    
    
    
    
    
    
}
