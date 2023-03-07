//
//  SignupViewModel.swift
//  Shopify Admin
//
//  Created by Ahmed Fekry on 07/03/2023.
//

import Foundation
class SignUpViewModel{
    
    var bindingSignUp:(()->())?
    
    var ObservableSignUp : Int? {
        didSet {
            bindingSignUp!()
        }
    }
    
func setCustomer(setcustomer:Customer){
    CustomerReg.CustomereRegister(Newcustomer: setcustomer) { check in
        self.ObservableSignUp = check
    }
    }
   
    
}

