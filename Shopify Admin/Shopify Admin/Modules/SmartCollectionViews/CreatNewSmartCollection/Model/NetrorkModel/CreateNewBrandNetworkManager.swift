//
//  CreateNewBrandNetworkManager.swift
//  Shopify Admin
//
//  Created by Ahmed Fekry on 11/03/2023.
//

import Foundation

class CreateNewBrandNetworkManager {
    
    
    static func addNewCollection(brandName : String , brandLogo : String){
        
        guard let url = URL(string: "https://12cda6f78842e3d15dd501d7e1fbc322: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@mad-ios1.myshopify.com/admin/api/2023-01/smart_collections.json") else {
            print("error in URL")
            return
        }
        var requeest = URLRequest(url: url)
        requeest.httpMethod = "POST"
        requeest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let body : [String : Any] = ["smart_collection": ["title": "\(brandName)",
                                                  "body_html" : "details of the new product",
                                                  "disjunctive" : false,
                                                  "rules": [
                                                            [
                                                             "column": "variant_price",
                                                             "relation": "less_than",
                                                             "condition": "20"
                                                            ]
                                                           ],
                                                   "image": [
                                                            "alt": "Fekry New Collection",
                                                            "width": 1,
                                                            "height": 1,
                                                            "src": "\(brandLogo)"
                                                          ],
                                                  "published_scope": "global",
                                                 ]
                                     ]
        
        requeest.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
        requeest.httpShouldHandleCookies = false
        
        let task = URLSession.shared.dataTask(with: requeest, completionHandler: {data , response ,error in
            guard let data = data , error == nil else{return}
            if let httpResponse = response as? HTTPURLResponse {
                print("New Collection Added: \(httpResponse.statusCode)")
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

    
    
    
    
}
