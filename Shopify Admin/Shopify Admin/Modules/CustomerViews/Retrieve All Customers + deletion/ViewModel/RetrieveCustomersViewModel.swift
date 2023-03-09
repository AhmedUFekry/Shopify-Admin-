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
    var deletedCustomerID : Int?{
        didSet{
                
        }
    }
    
    let cutomersURL = "https://12cda6f78842e3d15dd501d7e1fbc322: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@mad-ios1.myshopify.com/admin/api/2023-01/customers.json"
    
    
    
    func getAllCustomer (){
        ApiService.fetchFromApi(API_URL: cutomersURL) { [weak self] data in
            self?.AllCustomersResponse = data
            
        }
    }
    
    func deleteCustomer(customerID : Int){
        Shopify_Admin.deleteCustomer.delete(customerId: customerID) {
            print("Costomer Deleted *************************")
        }
    }
    
    
}
