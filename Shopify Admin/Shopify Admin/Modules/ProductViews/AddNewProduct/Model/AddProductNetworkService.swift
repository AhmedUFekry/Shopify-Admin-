//
//  AddProductNetworkService.swift
//  Shopify Admin
//
//  Created by Ahmed Fekry on 11/03/2023.
//

import Foundation
 class AddProductNetworkManager{
    
   static func addNewProduct(product_title : String , product_discription: String ,product_vendor: String , product_type: String , status: String , publish : Bool , product_price: Int){
        
        guard let url = URL(string: "https://12cda6f78842e3d15dd501d7e1fbc322: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@mad-ios1.myshopify.com/admin/api/2023-01/products.json") else {
            print("error in URL")
            return
        }
        var requeest = URLRequest(url: url)
        requeest.httpMethod = "POST"
        requeest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let body : [String : Any] = ["product": ["title": "\(product_title) ",
                                                  "body_html" : "\(product_discription)",
                                                  "vendor": "\(product_vendor)",
                                                  "product_type": "\(product_type)",
                                                  "status": "\(status)",
                                                  "published": publish,
                                                  "variants": [
                                                        [
                                                            "option1": "Yellow",
                                                            "price": product_price,
                                                            "inventory_managment":"shopify"
                                                        ]
                                                  ]
                                                 ]
                                     ]
        
        requeest.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
        requeest.httpShouldHandleCookies = false
        
        let task = URLSession.shared.dataTask(with: requeest, completionHandler: {data , response ,error in
            guard let data = data , error == nil else{return}
            if let httpResponse = response as? HTTPURLResponse {
                print("New Product Added: \(httpResponse.statusCode)")
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
