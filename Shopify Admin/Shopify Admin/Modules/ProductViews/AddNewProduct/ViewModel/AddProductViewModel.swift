//
//  AddProductViewModel.swift
//  Shopify Admin
//
//  Created by Ahmed Fekry on 11/03/2023.
//

import Foundation
class AddProductViewModel{
    
    func addProduct (product_title: String, product_discription: String, product_vendor: String, product_type: String, status: String, publish: Bool, product_price: Int){
        AddProductNetworkManager.addNewProduct(product_title: product_title, product_discription: product_discription, product_vendor: product_vendor, product_type: product_type, status: status, publish: publish, product_price: product_price)
    }
}
