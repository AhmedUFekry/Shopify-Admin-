//
//  ProductsViewModel.swift
//  Shopify Admin
//
//  Created by Ahmed Fekry on 11/03/2023.
//

import Foundation
class ProductsViewModel
{
    
    var bindingproductsBrand:(()->())?


    
    var ObservableproductsBrand : product? {
        didSet {
            bindingproductsBrand!()
        }
    }
    
    
    func getproductsBrand(PRODUCTS_BRAND_URL : String)
    {
        ApiService.fetchFromApi(API_URL: PRODUCTS_BRAND_URL) {[weak self] data in
            self?.ObservableproductsBrand = data
        }
    }
    
    
}
