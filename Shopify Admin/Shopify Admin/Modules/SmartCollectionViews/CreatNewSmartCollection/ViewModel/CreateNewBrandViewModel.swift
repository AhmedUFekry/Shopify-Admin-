//
//  CreateNewBrandViewModel.swift
//  Shopify Admin
//
//  Created by Ahmed Fekry on 11/03/2023.
//

import Foundation

class CreateNewBrandViewModel {
    
    
    func CreateNewBrand(brandNamee: String , brandLogoo: String){
        
        CreateNewBrandNetworkManager.addNewCollection(brandName: brandNamee, brandLogo: brandLogoo)
        
    }
    
    
}
