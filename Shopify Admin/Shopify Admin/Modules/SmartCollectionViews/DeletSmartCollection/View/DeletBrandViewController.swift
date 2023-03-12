//
//  DeletBrandViewController.swift
//  Shopify Admin
//
//  Created by Ahmed Fekry on 12/03/2023.
//

import UIKit

class DeletBrandViewController: UIViewController {
    var brandID : Int?
    var brandTitle : String?
   var DeleteBrandViewModelObj : DeleteBrandViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        DeleteBrandViewModelObj = DeleteBrandViewModel()
        
        
    }
    
    
    
    @IBAction func DeleteBrandButton(_ sender: Any) {
        
        DeleteBrandViewModelObj?.deletBrand(brandID: brandID!)
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
}
