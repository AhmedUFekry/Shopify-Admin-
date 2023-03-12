//
//  HomeViewModel.swift
//  Shopify Admin
//
//  Created by Ahmed Fekry on 12/03/2023.
//

import Foundation
protocol getBrands {
  func getAllBrands()
}

class HomeViewModel : getBrands {
    
    var bindingBrands:(()->())?
    
    var ObservableBrands : Brands? {
        didSet {
            bindingBrands!()
        }
    }
    

    let API_URL = "https://12cda6f78842e3d15dd501d7e1fbc322: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@mad-ios1.myshopify.com/admin/api/2023-01/smart_collections.json"
    func getAllBrands(){
        ApiService.fetchFromApi(API_URL: API_URL) { [weak self] data in
            self?.ObservableBrands = data
            
        }
    }
}
