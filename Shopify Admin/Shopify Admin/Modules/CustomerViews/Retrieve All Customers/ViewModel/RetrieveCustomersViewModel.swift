//
//  RetrieveCustomersViewModel.swift
//  Shopify Admin
//
//  Created by Ahmed Fekry on 08/03/2023.
//

import Foundation

class RetrieveCustomersViewModel{
    
    var bindingCustomers : (()->()) = {}
    var AllCustomersResponse : AllCustomers?{
        didSet{
                bindingCustomers()
        }
    }
    
    let cutomersURL = "https://80300e359dad594ca2466b7c53e94435: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@mad-ism202.myshopify.com/admin/api/2023-01/customers.json"
    
    
    
    func getAllCustomer (){
        ApiService.fetchFromApi(API_URL: cutomersURL) { [weak self] data in
            self?.AllCustomersResponse = data
            
        }
    }
    
    
}
