//
//  LoginViewModel.swift
//  Shopify Admin
//
//  Created by Ahmed Fekry on 07/03/2023.
//

import Foundation

class loginViewModel{
    
    var bindingLogin:(()->())?
    
    var ObservableLogin : AllCustomers? {
        didSet {
            bindingLogin!()
        }
    }
    
    func getCustomer(){
        Login.loadDataFromURL { retrivecustomer,_ in
            self.ObservableLogin = retrivecustomer
        }
    }
    
    func AuthCustomer(customerEmail:String,customerPasssword:String)->Int{
        var x = 0
        
        if let obserable = ObservableLogin {
            print(obserable.customers.count)
            for i in 0..<(obserable.customers.count){
                if customerEmail == obserable.customers[i].email && customerPasssword == obserable.customers[i].note{
                    x = 1
                    UserDefaults.standard.set(obserable.customers[i].id, forKey: "loginid")
                    let userDefultId =  UserDefaults.standard.integer(forKey:"loginid")
                        print("JSON STRING IS", userDefultId ?? 0)
                }
                
        }
          
        }
        return x

    }
}
