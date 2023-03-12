//
//  DeleteBrandViewModel.swift
//  Shopify Admin
//
//  Created by Ahmed Fekry on 12/03/2023.
//

import Foundation
class DeleteBrandViewModel {
    
    func deletBrand (brandID: Int){
        DeleteBrandNetworkManager.deleteCollection(collectionID: brandID) {
            print("brand Deleted Successfully")
        }
        
    }
    
    
}
