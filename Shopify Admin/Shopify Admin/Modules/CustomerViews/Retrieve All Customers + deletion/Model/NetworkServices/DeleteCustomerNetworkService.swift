//
//  DeleteCustomerNetworkService.swift
//  Shopify Admin
//
//  Created by Ahmed Fekry on 08/03/2023.
//

import Foundation
protocol deleteCustomerProtocol {
    static func delete(customerId: Int,completion:@escaping () -> Void)
}
class deleteCustomer : deleteCustomerProtocol {
   static func delete(customerId: Int,completion:@escaping () -> Void) {
        let url = URL(string:"https://12cda6f78842e3d15dd501d7e1fbc322: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@mad-ios1.myshopify.com/admin/api/2023-01/customers/\(customerId).json")
        var urlRequest = URLRequest(url: url!)
        urlRequest.httpMethod = "DELETE"
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-type")
        //urlRequest.httpShouldHandleCookies = false
        let task = URLSession.shared.dataTask(with: urlRequest) { data , response, error in
            guard data != nil else {
                print ("user not Found")
                return
            }
           
                guard let httpResponsee = response as? HTTPURLResponse else{return}
            if httpResponsee.statusCode == 200{
                print("customer removed successfully \(httpResponsee.statusCode)")
            }else{
                print("faild to delete***********************")
            }
        }
        task.resume()
    }
}

