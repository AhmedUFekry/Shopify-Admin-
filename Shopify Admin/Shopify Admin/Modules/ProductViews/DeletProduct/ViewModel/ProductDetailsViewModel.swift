//
//  ProductDetailsViewModel.swift
//  Shopify Admin
//
//  Created by Ahmed Fekry on 11/03/2023.
//

import Foundation
protocol getProduct {
    
    func getProductDetails(productId:Int)
    static func deleteProduct(productID : Int)
}

class ProductDetailViewModel : getProduct {
   
    
    var bindingProduct:(()->())?
    
    var ObservableProduct : ProductDetails? {
        didSet {
            bindingProduct!()
        }
    }
    
    func getProductDetails(productId:Int) {
        var API_URL = "https://12cda6f78842e3d15dd501d7e1fbc322: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@mad-ios1.myshopify.com/admin/api/2023-01/products/\(productId).json"
        
        ApiService.fetchFromApi(API_URL: API_URL) { [weak self] (fetchProduct:ProductDetails?) in
            self?.ObservableProduct = fetchProduct

        }
        

    }
    static func deleteProduct(productID : Int){
        DeleteProductNetworkManager.deleteProduct(productId: productID) {
            print("product deleted Succesfully")
        }
    }
    


}
